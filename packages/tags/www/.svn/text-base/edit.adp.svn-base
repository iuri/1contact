<master>
<property name="title">@title;noquote@</property>
<property name="context">@context;noquote@</property>
<property name="focus">tags.my_tags</property>

<h1>@title;noquote@</h1>

<blockquote>

<if @return_url@ not nil><a href="@return_url@"> #tags.goback#</a></if>

<h2><img src="/resources/tags/icon-tag-24x24.gif"> #tags.Your_Tags#</h2>
<p>
<formtemplate id="tags" style="inline"></formtemplate>
</p>
<p>
<strong>#tags.Page_Tags#:</strong> <small>#tags.item_tags_following#</small></p>
<p>@item_tags@</p>

<p>
<strong>#tags.Popular_Tags#:</strong> <small>#tags.system_tags_following# (#tags.Click_a_tag#)</small></p>
<p>
<multiple name="system_tags"> <a href="#" onclick="document.tags.my_tags.value = document.tags.my_tags.value+' @system_tags.tag@';">@system_tags.tag;noquote@</a></multiple>
</p>

</blockquote>

