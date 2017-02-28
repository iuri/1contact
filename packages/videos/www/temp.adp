<master>

<!-- "Video For Everybody" v0.4.1 by Kroc Camen of Camen Design <camendesign.com/code/video_for_everybody>
     =================================================================================================================== -->
<!-- first try HTML5 playback: if serving as XML, expand `controls` to `controls="controls"` and autoplay likewise       -->
<!-- warning: playback does not work on iPad/iPhone if you include the poster attribute! fixed in iOS4.0                 -->
<video width="640" height="360" controls preload="none">
    <!-- MP4 must be first for iPad! -->
    <source src="__VIDEO__.MP4" type="video/mp4" /><!-- WebKit video    -->
    <source src="__VIDEO__.webm" type="video/webm" /><!-- Chrome / Newest versions of Firefox and Opera -->
    <source src="__VIDEO__.OGV" type="video/ogg" /><!-- Firefox / Opera -->
    <!-- fallback to Flash: -->
    <object width="640" height="384" type="application/x-shockwave-flash" data="__FLASH__.SWF">
        <!-- Firefox uses the `data` attribute above, IE/Safari uses the param below -->
        <param name="movie" value="__FLASH__.SWF" />
        <param name="flashvars" value="image=__POSTER__.JPG&amp;file=__VIDEO__.MP4" />
        <!-- fallback image. note the title field below, put the title of the video there -->
        <img src="__VIDEO__.JPG" width="640" height="360" alt="__TITLE__"
             title="No video playback capabilities, please download the video below" />
    </object>
</video>
<!-- you *must* offer a download link as they may be able to play the file locally. customise this bit all you want -->
<p> <strong>Download Video:</strong>
    Closed Format:  <a href="__VIDEO__.MP4">"MP4"</a>
    Open Format:    <a href="__VIDEO__.OGV">"OGG"</a>
</p>
