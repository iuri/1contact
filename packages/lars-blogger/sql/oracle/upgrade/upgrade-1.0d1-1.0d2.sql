--
-- lars-blogger-package-create.sql
-- 
-- @author Lars Pind
-- @author Yon (Yon@milliped.com) Oracle Port
-- 
-- @cvs-id $Id: upgrade-1.0d1-1.0d2.sql,v 1.1 2003/10/08 16:59:22 mohanp Exp $
--

create or replace package pinds_blog_entry
as

    function new (
        entry_id in pinds_blog_entries.entry_id%TYPE default null,
        package_id in pinds_blog_entries.package_id%TYPE,
        title in pinds_blog_entries.title%TYPE default null,
        title_url in pinds_blog_entries.title_url%TYPE default null,
        content in varchar default null,
        content_format in varchar default 'text/html',
        entry_date in pinds_blog_entries.entry_date%TYPE default null,
        draft_p in pinds_blog_entries.draft_p%TYPE default 'f',
        creation_user in acs_objects.creation_user%TYPE default null,
        creation_ip in acs_objects.creation_ip%TYPE default null
    ) return pinds_blog_entries.entry_id%TYPE;

    procedure del (
        entry_id in pinds_blog_entries.entry_id%TYPE
    );

    function title (
        entry_id in pinds_blog_entries.entry_id%TYPE
    ) return pinds_blog_entries.title%TYPE;

end pinds_blog_entry;
/
show errors

create or replace package body pinds_blog_entry
as

    function new (
        entry_id in pinds_blog_entries.entry_id%TYPE default null,
        package_id in pinds_blog_entries.package_id%TYPE,
        title in pinds_blog_entries.title%TYPE default null,
        title_url in pinds_blog_entries.title_url%TYPE default null,
        content in varchar default null,
        content_format in varchar default 'text/html',
        entry_date in pinds_blog_entries.entry_date%TYPE default null,
        draft_p in pinds_blog_entries.draft_p%TYPE default 'f',
        creation_user in acs_objects.creation_user%TYPE default null,
        creation_ip in acs_objects.creation_ip%TYPE default null
    ) return pinds_blog_entries.entry_id%TYPE
    is
        v_entry_id pinds_blog_entries.entry_id%TYPE;
    begin

        v_entry_id := acs_object.new(
            object_id => pinds_blog_entry.new.entry_id,
            object_type => 'pinds_blog_entry',
            creation_date => sysdate,
            creation_user => pinds_blog_entry.new.creation_user,
            creation_ip => pinds_blog_entry.new.creation_ip,
            context_id => pinds_blog_entry.new.package_id
        );

        insert into pinds_blog_entries (
            entry_id, 
            package_id,
            title,
            title_url,
            content,
            content_format,
            entry_date,
            posted_date,
            draft_p,
            deleted_p
        ) values (
            v_entry_id, 
            pinds_blog_entry.new.package_id,
            pinds_blog_entry.new.title,
            pinds_blog_entry.new.title_url,
            pinds_blog_entry.new.content,
            pinds_blog_entry.new.content_format,
            pinds_blog_entry.new.entry_date,
            sysdate,
            pinds_blog_entry.new.draft_p,
            'f'
        );

        return v_entry_id;

    end new;

    procedure del (
        entry_id in pinds_blog_entries.entry_id%TYPE
    )
    is
    begin

        delete
        from pinds_blog_entries
        where entry_id = pinds_blog_entry.del.entry_id;

        acs_object.del(pinds_blog_entry.del.entry_id);

    end del;

    function title (
        entry_id in pinds_blog_entries.entry_id%TYPE
    ) return pinds_blog_entries.title%TYPE
    is
        v_title pinds_blog_entries.title%TYPE;
    begin

        select title
        into v_title
        from pinds_blog_entries
        where entry_id = pinds_blog_entry.title.entry_id;

        return v_title;

    exception when no_data_found then
        return '';

    end title;

end pinds_blog_entry;
/
show errors

create or replace package weblogger_channel
as

    function new (
        channel_id in weblogger_channels.channel_id%TYPE default null,
        package_id in weblogger_channels.package_id%TYPE,
        user_id in weblogger_channels.user_id%TYPE default null,
        creation_user in acs_objects.creation_user%TYPE default null,
        creation_ip in acs_objects.creation_ip%TYPE default null
    ) return weblogger_channels.channel_id%TYPE;

    procedure del (
        channel_id in weblogger_channels.channel_id%TYPE
    );

end weblogger_channel;
/
show errors


create or replace package body weblogger_channel
as

    function new (
        channel_id in weblogger_channels.channel_id%TYPE default null,
        package_id in weblogger_channels.package_id%TYPE,
        user_id in weblogger_channels.user_id%TYPE default null,
        creation_user in acs_objects.creation_user%TYPE default null,
        creation_ip in acs_objects.creation_ip%TYPE default null
    ) return weblogger_channels.channel_id%TYPE
    is
        v_channel_id weblogger_channels.channel_id%TYPE;
    begin

        v_channel_id := acs_object.new(
            object_id => weblogger_channel.new.channel_id,
            object_type => 'weblogger_channel',
            creation_date => sysdate,
            creation_user => weblogger_channel.new.creation_user,
            creation_ip => weblogger_channel.new.creation_ip,
            context_id => weblogger_channel.new.package_id
        );

        insert into weblogger_channels (
           channel_id, 
           package_id,
           user_id      
        ) values (
           v_channel_id, 
           weblogger_channel.new.package_id,
           weblogger_channel.new.user_id
        );

        return v_channel_id;

    end new;

    procedure del (
        channel_id in weblogger_channels.channel_id%TYPE
    )
    is
    begin

        delete
        from weblogger_channels
        where channel_id = weblogger_channel.del.channel_id;

        acs_object.del(weblogger_channel.del.channel_id);

    end del;

end weblogger_channel;
/
show errors
