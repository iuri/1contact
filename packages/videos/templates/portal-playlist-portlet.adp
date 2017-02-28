 
<div id='mediaspace'>This text will be replaced</div>
 
<script type='text/javascript'>
  var so = new SWFObject('/resources/videos/player.swf','mpl','@width@','@height@','9');
  so.addParam('allowfullscreen','true');
  so.addVariable('file','@url@/playlist.xml');
  so.addVariable('playlistsize','@playlist_size@');
  so.addVariable('playlist','bottom');
  so.addVariable('dock','true');
  so.addVariable('backcolor','F8F7F2');

  so.write('mediaspace');
</script>
