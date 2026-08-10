(function() {
  var style = getComputedStyle(document.documentElement);
  var accent = style.getPropertyValue('--accent').trim();
  var accent2 = style.getPropertyValue('--accent2').trim();
  var ink = style.getPropertyValue('--ink').trim();
  var muted = style.getPropertyValue('--muted').trim();
  var rule = style.getPropertyValue('--rule').trim();
  var bg2 = style.getPropertyValue('--bg2').trim();
  var bg = style.getPropertyValue('--bg').trim();

  // --- Chart 1: Chain Revenue Bar ---
  var chart1 = echarts.init(document.getElementById('chart-chain-revenue'), null, { renderer: 'svg' });
  chart1.setOption({
    animation: false,
    tooltip: { appendToBody: true, trigger: 'axis', axisPointer: { type: 'shadow' } },
    grid: { left: '3%', right: '4%', bottom: '3%', top: 20, containLabel: true },
    xAxis: {
      type: 'category',
      data: ['Solana', 'Hyperliquid', 'Tron', 'Ethereum', 'X Layer'],
      axisLabel: { color: muted, fontSize: 13 },
      axisLine: { lineStyle: { color: rule } },
      axisTick: { show: false }
    },
    yAxis: {
      type: 'value',
      name: '亿美元',
      axisLabel: { color: muted, fontSize: 12 },
      axisLine: { lineStyle: { color: rule } },
      splitLine: { lineStyle: { color: rule } }
    },
    series: [{
      type: 'bar',
      data: [
        { value: 13, itemStyle: { color: accent } },
        { value: 8.16, itemStyle: { color: accent } },
        { value: 6.08, itemStyle: { color: accent } },
        { value: 6, itemStyle: { color: accent } },
        { value: 0.8, itemStyle: { color: accent2 } }
      ],
      barWidth: '50%',
      label: { show: true, position: 'top', color: ink, fontSize: 13, formatter: function(p) { return p.value + '亿'; } }
    }]
  });
  window.addEventListener('resize', function() { chart1.resize(); });

  // --- Chart 2: Competitor Radar ---
  var chart2 = echarts.init(document.getElementById('chart-competitor'), null, { renderer: 'svg' });
  chart2.setOption({
    animation: false,
    tooltip: { appendToBody: true },
    legend: {
      data: ['OKX X Layer', 'Coinbase Base', 'Binance BSC'],
      bottom: 0,
      textStyle: { color: muted, fontSize: 12 }
    },
    radar: {
      center: ['50%', '52%'],
      radius: '70%',
      indicator: [
        { name: 'AI Agent适配', max: 10 },
        { name: 'Gas成本', max: 10 },
        { name: '生态丰富度', max: 10 },
        { name: '开发者工具', max: 10 },
        { name: '全球覆盖', max: 10 },
        { name: '合规性', max: 10 }
      ],
      axisName: { color: muted, fontSize: 12 },
      splitArea: { areaStyle: { color: [bg, bg] } },
      splitLine: { lineStyle: { color: rule } },
      axisLine: { lineStyle: { color: rule } }
    },
    series: [{
      type: 'radar',
      data: [
        {
          name: 'OKX X Layer',
          value: [9, 10, 7, 9, 9, 7],
          lineStyle: { color: accent, width: 2 },
          areaStyle: { color: accent, opacity: 0.15 },
          itemStyle: { color: accent },
          symbol: 'circle',
          symbolSize: 6
        },
        {
          name: 'Coinbase Base',
          value: [8, 7, 8, 8, 6, 9],
          lineStyle: { color: accent2, width: 2 },
          areaStyle: { color: accent2, opacity: 0.1 },
          itemStyle: { color: accent2 },
          symbol: 'circle',
          symbolSize: 6
        },
        {
          name: 'Binance BSC',
          value: [5, 6, 9, 6, 9, 8],
          lineStyle: { color: muted, width: 2 },
          areaStyle: { color: muted, opacity: 0.1 },
          itemStyle: { color: muted },
          symbol: 'circle',
          symbolSize: 6
        }
      ]
    }]
  });
  window.addEventListener('resize', function() { chart2.resize(); });
})();
