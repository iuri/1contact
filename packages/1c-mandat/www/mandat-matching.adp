<master>
<if @annonces:rowcount@ gt 0>
  <listtemplate name="annonces"></listtemplate>
</if>
<else>
  #1c-annonce.No_records#
</else>