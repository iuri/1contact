<?xml version="1.0"?>

<queryset>
  <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

  <fullquery name="delete_subscr">
    <querytext>
        begin
            :1 := rss_gen_subscr.del (:subscr_id);
        end;
    </querytext>
  </fullquery>

</queryset>
