<master src="/www/blank-master">
<if @doc@ defined><property name="&doc">doc</property></if>
<if @body@ defined><property name="&body">body</property></if>
<if @head@ not nil><property name="head">@head;literal@</property></if>
<if @focus@ not nil><property name="focus">@focus;literal@</property></if>
<property name="skip_link">@skip_link;literal@</property>




<slave>