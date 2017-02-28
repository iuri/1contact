--
-- packages/acs-messaging/sql/acs-messaging-packages.sql
--
-- @author John Prevost <jmp@arsdigita.com>
-- @author Phong Nguyen <phong@arsdigita.com>
-- @author Jon Griffin <jon@jongriffin.com>
-- @creation-date 2000-08-27
-- @cvs-id $Id: acs-messaging-packages.sql,v 1.20 2013/03/30 13:22:22 gustafn Exp $
--
-- updated for OpenACS by Jon Griffin
--



-- added
select define_function_args('acs_message__edit','message_id,title;null,description;null,mime_type;text/plain,text;null,data;null,creation_date;sysdate,creation_user;null,creation_ip;null,is_live;t');

--
-- procedure acs_message__edit/10
--
CREATE OR REPLACE FUNCTION acs_message__edit(
   p_message_id integer,
   p_title varchar,             -- default null
   p_description varchar,       -- default null
   p_mime_type varchar,         -- default 'text/plain'
   p_text text,                 -- default null
   p_data integer,              -- default null
   p_creation_date timestamptz, -- default sysdate
   p_creation_user integer,     -- default null
   p_creation_ip varchar,       -- default null
   p_is_live boolean            -- default 't'

) RETURNS integer AS $$
DECLARE
    v_revision_id cr_revisions.revision_id%TYPE;
BEGIN
    -- create a new revision using whichever call is appropriate
    if p_data is not null then
		-- need to take care of blob?
        v_revision_id := content_revision__new (
            p_message_id,		-- item_id        
            p_title,			-- title          
            p_description,		-- description    
            p_data,			-- data           
            p_mime_type,		-- mime_type      
            p_creation_date,		-- creation_date  
            p_creation_user,		-- creation_user  
            p_creation_ip		-- creation_ip    
        );
    else if p_title is not null or p_text is not null then
        v_revision_id := content_revision__new (
            p_title,			-- title          
            p_description,		-- description    
			now(),		-- publish_date
            p_mime_type,		-- mime_type      
			null,		-- nls_language
            p_text,			-- text           
            p_message_id,		-- item_id        
			null,		-- revision_id
            p_creation_date,		-- creation_date  
            p_creation_user,		-- creation_user  
            p_creation_ip		-- creation_ip    
        );      
    end if;
	end if;

    -- test for auto approval of revision   
    if p_is_live then 
        perform content_item__set_live_revision(v_revision_id);
    end if;

    return v_revision_id;
END;
$$ LANGUAGE plpgsql;
   
----------------
-- MAJOR NOTE OF NON-COMPLIANCE
-- I am exercising my rights as the porter here!
-- I can only use 16 parameters so I am changing one
-- creation_date will default to sysdate and not be a parameter
-- possibly another function can be made to change that
-- although I really don't see much need for this.
-- Jon Griffin 05-21-2001
----------------



-- added
select define_function_args('acs_message__new','message_id,reply_to,sent_date,sender,rfc822_id,title,description,mime_type,text,data,parent_id,context_id,creation_user,creation_ip,object_type,is_live,package_id');

--
-- procedure acs_message__new/17
--
CREATE OR REPLACE FUNCTION acs_message__new(
   p_message_id integer,    --default null,
   p_reply_to integer,      --default null,
   p_sent_date timestamptz, --default sysdate,
   p_sender integer,        --default null,
   p_rfc822_id varchar,     --default null,
   p_title varchar,         --default null,
   p_description varchar,   --default null,
   p_mime_type varchar,     --default 'text/plain',
   p_text text,             --default null,
   p_data integer,          --default null,
   p_parent_id integer,     --default 0,
   p_context_id integer,
   p_creation_user integer, --default null,
   p_creation_ip varchar,   --default null,
   p_object_type varchar,   --default 'acs_message',
   p_is_live boolean,       --default 't'
   p_package_id integer

) RETURNS integer AS $$
DECLARE
        p_creation_date timestamptz := current_timestamp;  -- alias for $13 --default sysdate,
        v_message_id   acs_messages.message_id%TYPE;
        v_rfc822_id    acs_messages.rfc822_id%TYPE;
        v_revision_id  cr_revisions.revision_id%TYPE;
		v_system_url   varchar;
		v_domain_name  varchar;
		v_idx		   integer;
    BEGIN
        -- generate a message id now so we can get an rfc822 message-id
        if p_message_id is null then
            select nextval('t_acs_object_id_seq') into v_message_id;
        else
            v_message_id := p_message_id;
        end if;

        -- need to make this mandatory also - jg
        -- this needs to be fixed up, but Oracle doesn't give us a way
        -- to get the FQDN

	-- vk: get SystemURL parameter and use it to extract domain name
         select apm__get_value(package_id, 'SystemURL') into v_system_url
          from apm_packages where package_key='acs-kernel';
		v_idx := position('http://' in v_system_url);
		v_domain_name := trim (substr(v_system_url, v_idx + 7));

        if p_rfc822_id is null then
           v_rfc822_id := current_date || '.' || v_message_id || '@' ||
               v_domain_name || '.hate';
        else
            v_rfc822_id := p_rfc822_id;
        end if;

        v_message_id := content_item__new (
            v_rfc822_id,			  -- name           
            p_parent_id,			  -- parent_id      
            p_message_id,			  -- item_id        
            null,				  -- locale
            p_creation_date,			  -- creation_date  
            p_creation_user,			  -- creation_user  
            p_context_id,			  -- context_id     
            p_creation_ip,			  -- creation_ip    
            p_object_type,			  -- item_subtype   
            'acs_message_revision',		  -- content_type   
            null,				  -- title
            null,				  -- description
            'text/plain',			  -- mime_type
            null,				  -- nls_language
            null,				  -- text
            'text',				  -- storage_type
            p_package_id
        );

        insert into acs_messages 
            (message_id, reply_to, sent_date, sender, rfc822_id)
        values 
            (v_message_id, p_reply_to, p_sent_date, p_sender, v_rfc822_id);

        -- create an initial revision for the new message
        v_revision_id := acs_message__edit (
            v_message_id,			   -- message_id     
            p_title,				   -- title          
            p_description,			   -- description    
            p_mime_type,			   -- mime_type      
            p_text,				   -- text           
            p_data,				   -- data           
            p_creation_date,			   -- creation_date  
            p_creation_user,			   -- creation_user  
            p_creation_ip,			   -- creation_ip    
            p_is_live				   -- is_live        
        );

        return v_message_id;
END;
$$ LANGUAGE plpgsql;



--
-- procedure acs_message__new/16
--
CREATE OR REPLACE FUNCTION acs_message__new(
   p_message_id integer,    --default null,
   p_reply_to integer,      --default null,
   p_sent_date timestamptz, --default sysdate,
   p_sender integer,        --default null,
   p_rfc822_id varchar,     --default null,
   p_title varchar,         --default null,
   p_description varchar,   --default null,
   p_mime_type varchar,     --default 'text/plain',
   p_text text,             --default null,
   p_data integer,          --default null,
   p_parent_id integer,     --default 0,
   p_context_id integer,
   p_creation_user integer, --default null,
   p_creation_ip varchar,   --default null,
   p_object_type varchar,   --default 'acs_message',
   p_is_live boolean        --default 't'

) RETURNS integer AS $$
DECLARE
        p_creation_date timestamptz := current_timestamp;  -- alias for $13 --default sysdate,
BEGIN
    return acs_message__new (p_message_id,
                             p_reply_to,
                             p_sent_date,
                             p_sender,
                             p_rfc822_id,
                             p_title,
                             p_description,
                             p_mime_type,
                             p_text,
                             p_data,
                             p_parent_id,
                             p_context_id,
                             p_creation_user,
                             p_creation_ip,
                             p_object_type,
                             p_is_live,
                             null::integer
   );
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__delete','message_id');

--
-- procedure acs_message__delete/1
--
CREATE OR REPLACE FUNCTION acs_message__delete(
   p_message_id integer
) RETURNS integer AS $$
DECLARE
BEGIN
    delete from acs_messages where message_id = p_message_id;
    perform content_item__delete(p_message_id);
    return 1;
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__message_p','message_id');

--
-- procedure acs_message__message_p/1
--
CREATE OR REPLACE FUNCTION acs_message__message_p(
   p_message_id integer
) RETURNS boolean AS $$
DECLARE
    v_check_message_id  integer;
BEGIN
    select count(message_id) into v_check_message_id
        from acs_messages where message_id = p_message_id;

    if v_check_message_id <> 0 then
        return 't';
    else
        return 'f';
    end if;
END;
$$ LANGUAGE plpgsql stable;



-- added

--
-- procedure acs_message__send/4
--
CREATE OR REPLACE FUNCTION acs_message__send(
   p_message_id integer,
   p_to_address varchar,
   p_grouping_id integer,   -- default null
   p_wait_until timestamptz -- default sysdate

) RETURNS integer AS $$
DECLARE
    v_wait_until timestamptz;
BEGIN
    v_wait_until := coalesce(p_wait_until, current_timestamp);
    insert into acs_messages_outgoing
        (message_id, to_address, grouping_id, wait_until)
    values
        (p_message_id, p_to_address, p_grouping_id, v_wait_until);
    return 1;
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__send','message_id,recipient_id,grouping_id;null,wait_until;sysdate');

--
-- procedure acs_message__send/4
--
CREATE OR REPLACE FUNCTION acs_message__send(
   p_message_id integer,
   p_recipient_id integer,
   p_grouping_id integer,   -- default null
   p_wait_until timestamptz -- default sysdate

) RETURNS integer AS $$
DECLARE
    v_wait_until timestamptz;
BEGIN
    v_wait_until := coalesce (p_wait_until, current_timestamp);
    insert into acs_messages_outgoing
        (message_id, to_address, grouping_id, wait_until)
    select p_message_id, p.email, p_grouping_id, v_wait_until
        from parties p
        where p.party_id = p_recipient_id;
    return 1;
END;
$$ LANGUAGE plpgsql;


-- Ported to take advantage of tree_sortkey column by DLP



-- added
select define_function_args('acs_message__first_ancestor','message_id');

--
-- procedure acs_message__first_ancestor/1
--
CREATE OR REPLACE FUNCTION acs_message__first_ancestor(
   p_message_id integer
) RETURNS integer AS $$
DECLARE
    v_message_id acs_messages.message_id%TYPE;
    v_ancestor_sk varbit;
BEGIN
    select tree_ancestor_key(tree_sortkey, 1) into v_ancestor_sk
      from acs_messages
     where message_id = p_message_id;

    select message_id into v_message_id
      from acs_messages
     where tree_sortkey = v_ancestor_sk;

    return v_message_id;
END;
$$ LANGUAGE plpgsql stable strict;

    -- ACHTUNG!  WARNING!  ACHTUNG!  WARNING!  ACHTUNG!  WARNING! --

    -- Developers: Please don't depend on the following functionality
    -- to remain in the same place.  Chances are very good these
    -- functions will migrate to another PL/SQL package or be replaced
    -- by direct calls to CR code in the near future.



-- added
select define_function_args('acs_message__new_file','message_id,file_id;null,file_name,title;null,description;null,mime_type;text/plain,data;null,creation_date;sysdate,creation_user;null,creation_ip;null,is_live;t,storage_type;file,package_id;null');

--
-- procedure acs_message__new_file/13
--
CREATE OR REPLACE FUNCTION acs_message__new_file(
   p_message_id integer,
   p_file_id integer,           -- default null
   p_file_name varchar,
   p_title varchar,             -- default null
   p_description text,          -- default null
   p_mime_type varchar,         -- default 'text/plain'
   p_data integer,              -- default null
   p_creation_date timestamptz, -- default sysdate
   p_creation_user integer,     -- default null
   p_creation_ip varchar,       -- default null
   p_is_live boolean,           -- default 't'
   p_storage_type varchar,      -- default 'file'
   p_package_id integer         -- default null

) RETURNS integer AS $$
DECLARE
    v_file_id      cr_items.item_id%TYPE;
    v_revision_id  cr_revisions.revision_id%TYPE;
BEGIN
    v_file_id := content_item__new (
        p_file_name,			   -- name           
        p_message_id,			   -- parent_id      
        p_file_id,			   -- item_id        
        null,				   -- locale
        p_creation_date,		   -- creation_date  
        p_creation_user,		   -- creation_user  
        null,				   -- context_id
        p_creation_ip,			   -- creation_ip    
        'content_item',		   -- item_subtype
        'content_revision',		   -- content_type
        null,				   -- title
        null,				   -- description
        'text/plain',			   -- mime_type
        null,				   -- nls_language
        null,				   -- text
	p_storage_type,			   -- storage_type
        p_package_id			   -- package_id
    );

    -- create an initial revision for the new attachment
    v_revision_id := acs_message__edit_file (
         v_file_id,			-- file_id        
         p_title,			-- title          
         p_description,			-- description    
         p_mime_type,			-- mime_type      
         p_data,			-- data        
         p_creation_date,		-- creation_date  
         p_creation_user,		-- creation_user  
         p_creation_ip,			-- creation_ip    
         p_is_live			-- is_live        
    );

    return v_file_id;
END;
$$ LANGUAGE plpgsql;



--
-- procedure acs_message__new_file/12
--
CREATE OR REPLACE FUNCTION acs_message__new_file(
   p_message_id integer,
   p_file_id integer,           -- default null
   p_file_name varchar,
   p_title varchar,             -- default null
   p_description text,          -- default null
   p_mime_type varchar,         -- default 'text/plain'
   p_data integer,              -- default null
   p_creation_date timestamptz, -- default sysdate
   p_creation_user integer,     -- default null
   p_creation_ip varchar,       -- default null
   p_is_live boolean,           -- default 't'
   p_storage_type varchar       -- default 'file'

) RETURNS integer AS $$
DECLARE
BEGIN
    return acs_message__new_file (p_message_id,
                                  p_file_id,
                                  p_file_name,
                                  p_title,
                                  p_description,
                                  p_mime_type,
                                  p_data,
                                  p_creation_date,
                                  p_creation_user,
                                  p_creation_ip,
                                  p_is_live,
                                  p_storage_type,
                                  null
   );
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__edit_file','file_id,title;null,description;null,mime_type;text/plain,data;null,creation_date;sysdate,creation_user;null,creation_ip;null,is_live;t');

--
-- procedure acs_message__edit_file/9
--
CREATE OR REPLACE FUNCTION acs_message__edit_file(
   p_file_id integer,
   p_title varchar,             -- default null
   p_description text,          -- default null
   p_mime_type varchar,         -- default 'text/plain'
   p_data integer,              -- default null
   p_creation_date timestamptz, -- default sysdate
   p_creation_user integer,     -- default null
   p_creation_ip varchar,       -- default null
   p_is_live boolean            -- default 't'

) RETURNS integer AS $$
DECLARE
    v_revision_id  cr_revisions.revision_id%TYPE;
BEGIN
    v_revision_id := content_revision__new (
        p_title,			-- title         
        p_description,
        current_timestamp,
        p_mime_type,			-- mime_type     
        NULL,
        p_data,				-- data          
        p_file_id,			-- item_id       
        NULL,
        p_creation_date,		-- creation_date 
        p_creation_user,		-- creation_user 
        p_creation_ip			-- creation_ip   
    );

    -- test for auto approval of revision
    if p_is_live then 
        perform content_item__set_live_revision(v_revision_id);
    end if;

    return v_revision_id;
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__delete_file','file_id');

--
-- procedure acs_message__delete_file/1
--
CREATE OR REPLACE FUNCTION acs_message__delete_file(
   p_file_id integer
) RETURNS integer AS $$
DECLARE
BEGIN
    perform content_item__delete(p_file_id);       
    return 1;
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__new_image','message_id,image_id;null,file_name,title;null,description;null,mime_type;text/plain,data;null,width;null,height;null,creation_date;sysdate,creation_user;null,creation_ip;null,is_live;t,storage_type;file,package_id;null');

--
-- procedure acs_message__new_image/15
--
CREATE OR REPLACE FUNCTION acs_message__new_image(
   p_message_id integer,
   p_image_id integer,          -- default null
   p_file_name varchar,
   p_title varchar,             -- default null
   p_description text,          -- default null
   p_mime_type varchar,         -- default 'text/plain'
   p_data integer,              -- default null
   p_width integer,             -- default null
   p_height integer,            -- default null
   p_creation_date timestamptz, -- default sysdate
   p_creation_user integer,     -- default null
   p_creation_ip varchar,       -- default null
   p_is_live boolean,           -- default 't'
   p_storage_type varchar,      -- default 'file'
   p_package_id integer         -- default null

) RETURNS integer AS $$
DECLARE
    v_image_id     cr_items.item_id%TYPE;
    v_revision_id  cr_revisions.revision_id%TYPE;
BEGIN
    v_image_id := content_item__new (
         p_file_name,				-- name          
         p_message_id,				-- parent_id     
         p_image_id,				-- item_id       
         null,					-- locale
         p_creation_date,			-- creation_date 
         p_creation_user,			-- creation_user 
         null,					-- context_id
         p_creation_ip,				-- creation_ip
	 'content_item',			-- item_subtype
	 'content_revision',			-- content_type
	 null,					-- title
	 null,					-- description
	 'text/plain',			-- mime_type
	 null,					-- nls_language
	 null,					-- text
	 'file',				-- storage_type
         p_package_id				-- package_id
    );

    -- create an initial revision for the new attachment
    v_revision_id := acs_message__edit_image (
         v_image_id,				-- image_id      
         p_title,				-- title         
         p_description,				-- description   
         p_mime_type,				-- mime_type     
         p_data,				-- data       
         p_width,				-- width         
         p_height,				-- height        
         p_creation_date,			-- creation_date 
         p_creation_user,			-- creation_user 
         p_creation_ip,				-- creation_ip   
         p_is_live				-- is_live       
    );

    return v_image_id;
END;
$$ LANGUAGE plpgsql;



--
-- procedure acs_message__new_image/14
--
CREATE OR REPLACE FUNCTION acs_message__new_image(
   p_message_id integer,
   p_image_id integer,          -- default null
   p_file_name varchar,
   p_title varchar,             -- default null
   p_description text,          -- default null
   p_mime_type varchar,         -- default 'text/plain'
   p_data integer,              -- default null
   p_width integer,             -- default null
   p_height integer,            -- default null
   p_creation_date timestamptz, -- default sysdate
   p_creation_user integer,     -- default null
   p_creation_ip varchar,       -- default null
   p_is_live boolean,           -- default 't'
   p_storage_type varchar       -- default 'file'

) RETURNS integer AS $$
DECLARE
BEGIN
    return acs_message__new_image (p_message_id,
                                   p_image_id,
                                   p_file_name,
                                   p_title,
                                   p_description,
                                   p_mime_type,
                                   p_data,
                                   p_width,
                                   p_height,
                                   p_creation_date,
                                   p_creation_user,
                                   p_creation_ip,
                                   p_is_live,
                                   p_storage_type,
                                   null
   );
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__edit_image','image_id,title;null,description;null,mime_type;text/plain,data;null,width;null,height;null,creation_date;sysdate,creation_user;null,creation_ip;null,is_live;t');

--
-- procedure acs_message__edit_image/11
--
CREATE OR REPLACE FUNCTION acs_message__edit_image(
   p_image_id integer,
   p_title varchar,             -- default null
   p_description text,          -- default null
   p_mime_type varchar,         -- default 'text/plain'
   p_data integer,              -- default null
   p_width integer,             -- default null
   p_height integer,            -- default null
   p_creation_date timestamptz, -- default sysdate
   p_creation_user integer,     -- default null
   p_creation_ip varchar,       -- default null
   p_is_live boolean            -- default 't'

) RETURNS integer AS $$
DECLARE
    v_revision_id  cr_revisions.revision_id%TYPE;
BEGIN
		-- not sure which __new to use
    v_revision_id := content_revision__new (
         p_title,             -- title         
         NULL,                -- description
         current_timestamp,   -- publish_date
         p_mime_type,         -- mime_type     
         NULL,                -- nls_language
         p_data,              -- data          
         p_image_id,          -- item_id       
         NULL,                -- revision_id
         p_creation_date,     -- creation_date 
         p_creation_user,     -- creation_user 
         p_creation_ip        -- creation_ip   
    );      

    -- insert new width and height values
    -- XXX fix after image.new exists
    insert into images
        (image_id, width, height)
    values
        (v_revision_id, p_width, p_height);

    -- test for auto approval of revision   
    if p_is_live then 
        perform content_item__set_live_revision(v_revision_id);
    end if;

    return v_revision_id;
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__delete_image','image_id');

--
-- procedure acs_message__delete_image/1
--
CREATE OR REPLACE FUNCTION acs_message__delete_image(
   p_image_id integer
) RETURNS integer AS $$
DECLARE
BEGIN
    perform image__delete(p_image_id);

    return 0;
END;
$$ LANGUAGE plpgsql;

    -- XXX should just call content_extlink.new


-- added
select define_function_args('acs_message__new_extlink','name;null,extlink_id;null,url,label;null,description;null,parent_id,creation_date;sysdate,creation_user;null,creation_ip;null,package_id;null');

--
-- procedure acs_message__new_extlink/10
--
CREATE OR REPLACE FUNCTION acs_message__new_extlink(
   p_name varchar,              -- default null
   p_extlink_id integer,        -- default null
   p_url varchar,
   p_label varchar,             -- default null
   p_description text,          -- default null
   p_parent_id integer,
   p_creation_date timestamptz, -- default sysdate
   p_creation_user integer,     -- default null
   p_creation_ip varchar,       -- default null
   p_package_id integer         -- default null

) RETURNS integer AS $$
DECLARE
    v_extlink_id  cr_extlinks.extlink_id%TYPE;
BEGIN
    v_extlink_id := content_extlink__new (
         p_name,			-- name          
         p_url,				-- url           
         p_label,			-- label         
         p_description,			-- description   
         p_parent_id,			-- parent_id     
         p_extlink_id,			-- extlink_id    
         p_creation_date,		-- creation_date 
         p_creation_user,		-- creation_user 
         p_creation_ip,			-- creation_ip
         p_package_id
    );

	return v_extlink_id;
END;
$$ LANGUAGE plpgsql;
    


--
-- procedure acs_message__new_extlink/9
--
CREATE OR REPLACE FUNCTION acs_message__new_extlink(
   p_name varchar,              -- default null
   p_extlink_id integer,        -- default null
   p_url varchar,
   p_label varchar,             -- default null
   p_description text,          -- default null
   p_parent_id integer,
   p_creation_date timestamptz, -- default sysdate
   p_creation_user integer,     -- default null
   p_creation_ip varchar        -- default null

) RETURNS integer AS $$
DECLARE
BEGIN
    return acs_message__new_extlink (p_name,
                                     p_extlink_id,
                                     p_url,
                                     p_label,
                                     p_description,
                                     p_parent_id,
                                     p_creation_date,
                                     p_creation_user,
                                     p_creation_ip,
                                     null
   );
END;
$$ LANGUAGE plpgsql;

-- XXX should just edit extlink


-- added
select define_function_args('acs_message__edit_extlink','extlink_id,url,label;null,description');

--
-- procedure acs_message__edit_extlink/4
--
CREATE OR REPLACE FUNCTION acs_message__edit_extlink(
   p_extlink_id integer,
   p_url varchar,
   p_label varchar,   -- default null
   p_description text --  default null

) RETURNS integer AS $$
DECLARE
    v_is_extlink   boolean;
BEGIN
    v_is_extlink := content_extlink__is_extlink(p_extlink_id);
    if v_is_extlink = 't' then
        update cr_extlinks
        set url = p_url,
            label = p_label,
            description = p_description
        where extlink_id = p_extlink_id;
    end if;
    return 0;
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__delete_extlink','extlink_id');

--
-- procedure acs_message__delete_extlink/1
--
CREATE OR REPLACE FUNCTION acs_message__delete_extlink(
   p_extlink_id integer
) RETURNS integer AS $$
DECLARE
BEGIN
    perform content_extlink__delete(p_extlink_id);

	return 0;
END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('acs_message__name','message_id');

--
-- procedure acs_message__name/1
--
CREATE OR REPLACE FUNCTION acs_message__name(
   p_message_id integer
) RETURNS varchar AS $$
DECLARE
    v_message_name   cr_revisions.title%TYPE;
BEGIN
    select title into v_message_name
        from acs_messages_all
        where message_id = p_message_id;
    return v_message_name;
END;
$$ LANGUAGE plpgsql stable strict;

