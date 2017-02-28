<master>




<script>

  function showDiv(elem){
            if(elem == 0) {
              document.getElementById('link_div').style.display = "block";
              document.getElementById('file_div').style.display = "none";
            } else {
              document.getElementById('file_div').style.display = "block";
              document.getElementById('link_div').style.display = "none";
           }
  }
</script>

<a href="#" id="link-bt" onClick="showDiv(0);">Link</a>
<a href="#" id="file-bt" onClick="showDiv(1);">File</a>

<div id="link_div" style="display: none;">
  <h1>Add Link</h1>
  
  <formtemplate id="video"></formtemplate>

</div>




<div id="file_div" style="display: none;">
  <h1>Add File</h1>

</div>





