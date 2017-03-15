
<property name="context">{/doc/workflow {Workflow}} {}</property>
<property name="doc(title)"></property>
<master>
<h3>A: WF #3: Redirect After Action</h3>
<p>After an action has been completed, depending on the action, we
will redirect you to one of:</p>
<ul>
<li>Your task list</li><li>The page for the case (e.g. the content item page in the right
package and folder).</li><li>The object list page (e.g. the folder page)</li><li>The "create new object" page.</li>
</ul>
<p>This will be specified in the workflow spec as an
"redirect_to" on actions, with possible values of
"task_list", "case", "case_list", or
"new_case".</p>
<p>This assumes we have already implemented #6 below.</p>
<p>It will require changes to the API, in order for
workflow::case::action::execute to be able to return a URL.</p>
<p>TODO: Look in more detail at what&#39;s needed.</p>
<p>Estimate: 6 hours. Risk: Med. Recommended.</p>
<h3>A: WF #10: Task list UI</h3>
<p>Write a generic task list UI that lets you find tasks which you
are supposed to do, and get to them.</p>
<p>It should use the list builder so you can sort, filter, and
paginate.</p>
<p>Requires #6.</p>
<p>Time estimate: 10 hours. Risk: Low.</p>
