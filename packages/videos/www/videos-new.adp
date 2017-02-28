<master>
<formtemplate id="video"></formtemplate>


<table align="center"><tr><td>
<div id="showbar" style="font-size:8pt;padding:2px;border:solid black 1px;visibility:hidden">
<span id="progress1">&nbsp; &nbsp;</span>
<span id="progress2">&nbsp; &nbsp;</span>
<span id="progress3">&nbsp; &nbsp;</span>
<span id="progress4">&nbsp; &nbsp;</span>
<span id="progress5">&nbsp; &nbsp;</span>
<span id="progress6">&nbsp; &nbsp;</span>
<span id="progress7">&nbsp; &nbsp;</span>
<span id="progress8">&nbsp; &nbsp;</span>
<span id="progress9">&nbsp; &nbsp;</span>
</div>
</td></tr></table>



<script language="javascript">
var progressEnd = 9; // set to number of progress <span>'s.
var progressColor = 'blue'; // set to progress bar color
var progressInterval = 1000; // set to time between updates (milli-seconds)

var progressAt = progressEnd;
var progressTimer;

function progress_clear() {
  for (var i = 1; i <= progressEnd; i++) document.getElementById('progress'+i).style.backgroundColor = 'transparent';
  progressAt = 0;
}

function progress_update() {
  document.getElementById('showbar').style.visibility = 'visible';
  progressAt++;
  if (progressAt > progressEnd) progress_clear();
  else document.getElementById('progress'+progressAt).style.backgroundColor = progressColor;
  progressTimer = setTimeout('progress_update()',progressInterval);
}
  
function progress_stop() {
  clearTimeout(progressTimer);
  progress_clear();
  document.getElementById('showbar').style.visibility = 'hidden';
}

progress_update(); // start progress bar

</script>

