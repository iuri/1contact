<master>
<property name="header_stuff">
<SCRIPT Language="JavaScript" src="/resources/diagram/diagram/diagram.js"></SCRIPT></property>

<include src="/packages/ix-currency/lib/currencies-display">



<h1>@code;noquote@ 
<if @diff@ lt 0><span style="color:red;">$@rate;noquote@ $@diff;noquote@ @percent;noquote@%</span> </if>
<if @diff@ eq 0><span style="color:blue;">$@rate;noquote@ $@diff;noquote@ @percent;noquote@%</span> </if>
<if @diff@ gt 0><span style="color:green;">$@rate;noquote@ $@diff;noquote@ @percent;noquote@%</span> </if>

 </h1>


<diagram name="mydiagram"></diagram>




<canvas id="myCanvas" width="578" height="200"></canvas>

    <script>
      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');
      context.beginPath();
      context.moveTo(20, 20);
      //context.bezierCurveTo(140, 10, 388, 10, 388, 170);
      //context.quadraticCurveTo(@data@);
      context.bezierCurveTo(@data@);
      context.lineWidth = 10;

      // line color
      context.strokeStyle = 'black';
      context.stroke();
    </script>

