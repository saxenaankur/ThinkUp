{include file=$tpl_path|cat:'_header.tpl'}
<div class="pull-right detail-btn"><button class="btn btn-mini" data-toggle="collapse" data-target="#chart-{$i->id}"><i class="icon-signal"></i></button></div>

<span class="label label-{if $i->emphasis eq '1'}inverse{elseif $i->emphasis eq '2'}success{elseif $i->emphasis eq '3'}error{else}info{/if}"><i class="icon-white icon-list"></i> {$i->prefix}</span> 

{$i->text}

<div class="insight-attachment-detail post">
    {include file=$tpl_path|cat:"_post.tpl" post=$i->related_data[0] hide_insight_header=true}
</div>

<div class="collapse in" id="chart-{$i->id}">

    <div id="response_rates_{$i->id}"></div>
    <script type="text/javascript">
        // Load the Visualization API and the standard charts
        google.load('visualization', '1');
        // Set a callback to run when the Google Visualization API is loaded.
        google.setOnLoadCallback(drawResponseRatesChart{$i->id} );

        {literal}
        function drawResponseRatesChart{/literal}{$i->id}{literal}() {
        {/literal}
            var response_rates_data_{$i->id} = new google.visualization.DataTable({$i->related_data[1]});

            {literal}
            var response_rates_chart_{/literal}{$i->id}{literal} = new google.visualization.ChartWrapper({
              containerId: 'response_rates_{/literal}{$i->id}{literal}',
              chartType: 'BarChart',
              dataTable: response_rates_data_{/literal}{$i->id}{literal},
              options: {
                  colors: ['#3e5d9a', '#3c8ecc', '#BBCCDD'],
                  isStacked: true,
                  width: 650,
                  height: 250,
                  chartArea:{left:300,height:"80%"},
                  legend: 'bottom',
                  hAxis: {
                    textStyle: { color: '#fff', fontSize: 1 }
                  },
                  vAxis: {
                    minValue: 0,
                    baselineColor: '#ccc',
                    textStyle: { color: '#999' },
                    gridlines: { color: '#eee' }
                  },
                }
            });
            response_rates_chart_{/literal}{$i->id}{literal}.draw();
        }
        {/literal}
    </script>
</div>

{include file=$tpl_path|cat:'_footer.tpl'}