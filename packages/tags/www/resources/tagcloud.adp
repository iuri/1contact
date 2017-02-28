    <style>
      .smallestTag { font-size: xx-small; }
      .smallTag { font-size: small; }
      .mediumTag { font-size: medium; }
      .largeTag { font-size: large; }
      .largestTag { font-size: xx-large; }
    </style>

    <div class="portlet">
      <if @tags:rowcount@ gt 0>
        <multiple name="tags">
          <a href="@tags_url@tagged-items?tag=@tags.tag@&return_url=@return_url@" class=@tags.class@>@tags.tag@</a>&nbsp;
        </multiple>
      </if>
      <else>
          No Tags
      </else>
    </div>
