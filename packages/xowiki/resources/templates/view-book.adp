<<<<<<< HEAD
<!-- Generated by ::xowiki::ADP_Generator on Fri Mar 10 12:32:17 BRT 2017 -->
=======
<!-- Generated by ::xowiki::ADP_Generator on Tue Mar 07 16:50:12 UTC 2017 -->
>>>>>>> 1c25353865b4f810e20e44ec5e5b28b4518efa5d
<master>
                  <property name="context">@context;literal@</property>
                  <if @item_id@ not nil><property name="displayed_object_id">@item_id;literal@</property></if>
                  <property name="&body">body</property>
                  <property name="&doc">doc</property>
                  <property name="head">
      @header_stuff;literal@</property>
<!-- The following DIV is needed for overlib to function! -->
          <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>    
          <div class='xowiki-content'>

<div style="float:left; width: 25%; font-size: .8em;
     background: url(/resources/xowiki/bw-shadow.png) no-repeat bottom right;
     margin-left: 6px; margin-top: 6px; padding: 0px;
">
                      <div style="position:relative; right:6px; bottom:6px; border: 1px solid #a9a9a9; padding: 5px 5px; background: #f8f8f8">
                      @toc;noquote@
                      </div></div>
                      <div style="float:right; width: 70%;">
                      <if @book_prev_link@ not nil or @book_relpos@ not nil or @book_next_link@ not nil>
                      <div class="book-navigation" style="background: #fff; border: 1px dotted #000; padding-top:3px; margin-bottom:0.5em;">
                      <table width='100%'
                      summary='This table provides a progress bar and buttons for next and previous pages'>
                      <colgroup><col width='20'><col><col width='20'>
                      </colgroup>
                      <tr>
                      <td>
                      <if @book_prev_link@ not nil>
                      <a href="@book_prev_link@" accesskey='p' ID="bookNavPrev.a" onclick='return TocTree.getPage("@book_prev_link@");'>
                      <img alt='Previous' src='/resources/xowiki/previous.png' width='15' ID="bookNavPrev.img"></a>
                      </if>
                      <else>
                      <a href="" accesskey='p' ID="bookNavPrev.a" onclick="">
                      <img alt='No Previous' src='/resources/xowiki/previous-end.png' width='15' ID="bookNavPrev.img"></a>
                      </else>
                      </td>

                      <td>
                      <if @book_relpos@ not nil>
                      <table width='100%'>
                      <colgroup><col></colgroup>
                      <tr><td style='font-size: 75%'><div style='width: @book_relpos@;' ID='bookNavBar'></div></td></tr>
                      <tr><td style='font-size: 75%; text-align:center;'><span ID='bookNavRelPosText'>@book_relpos@</span></td></tr>
                      </table>
                      </if>
                      </td>

                      <td ID="bookNavNext">
                      <if @book_next_link@ not nil>
                      <a href="@book_next_link@" accesskey='n' ID="bookNavNext.a" onclick='return TocTree.getPage("@book_next_link@");'>
                      <img alt='Next' src='/resources/xowiki/next.png' width='15' ID="bookNavNext.img"></a>
                      </if>
                      <else>
                      <a href="" accesskey='n' ID="bookNavNext.a" onclick="">
                      <img alt='No Next' src='/resources/xowiki/next-end.png' width='15' ID="bookNavNext.img"></a>
                      </else>
                      </td>
                      </tr>
                      </table>
                      </div>
                      </if>

                      <div id='book-page'>
                      <include src="view-page" &="package_id"
                      &="references" &="name" &="title" &="item_id" &="page" &="context" &="header_stuff" &="return_url"
                      &="content" &="references" &="lang_links" &="package_id"
                      &="rev_link" &="edit_link" &="delete_link" &="new_link" &="admin_link" &="index_link"
                      &="tags" &="no_tags" &="tags_with_links" &="save_tag_link" &="popular_tags_link"
                      &="per_object_categories_with_links"
                      &="digg_link" &="delicious_link" &="my_yahoo_link"
                      &="gc_link" &="gc_comments" &="notification_subscribe_link" &="notification_image"
                      &="top_includelets" &="folderhtml" &="page" &="doc" &="body">
                      </div>
                      </div>
                    
@footer;noquote@
</div> <!-- class='xowiki-content' -->
