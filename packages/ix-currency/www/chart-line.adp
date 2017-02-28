<script type="text/javascript"
          src="https://www.google.com/jsapi?autoload={
            'modules':[{
              'name':'visualization',
              'version':'1',
              'packages':['corechart']
            }]
          }"></script>

    <script type="text/javascript">
      google.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
	['Year', '@code@'],
	<multiple name="rates">
	  ['@rates.timestamp@', @rates.price@],
	</multiple>
        ]);

        var options = {
          title: 'Currency Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>





<if @untrusted_user_id@ eq 0>
<a href="@login_url@"><div id="curve_chart" style="width: 900px; height: 500px"></div></a>
</if>
<else>
<div id="curve_chart" style="width: 900px; height: 500px"></div>
</else>



