<master>

  <property name="doc(title)">#acs-subsite.Register#</property>
  <property name="context">{#acs-subsite.Register#}</property>
  <property name="focus">register.email</property>


<formtemplate id="user-new"></formtemplate>


<include src="@user_new_template;literal@" email="@email;literal@" return_url="@return_url;literal@" />
