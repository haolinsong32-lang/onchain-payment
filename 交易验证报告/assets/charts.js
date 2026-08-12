// charts.js - 交易验证报告图表
(function() {
  var style = getComputedStyle(document.documentElement);
  var accent = style.getPropertyValue('--accent').trim();
  var accent2 = style.getPropertyValue('--accent2').trim();
  var ink = style.getPropertyValue('--ink').trim();
  var muted = style.getPropertyValue('--muted').trim();
  var rule = style.getPropertyValue('--rule').trim();
  var bg2 = style.getPropertyValue('--bg2').trim();
  var green = style.getPropertyValue('--green').trim();

  // --- Pipeline Flow Chart ---
  var chart1 = echarts.init(document.getElementById('chart-pipeline'), null, { renderer: 'svg' });
  chart1.setOption({
    animation: false,
    tooltip: { trigger: 'item', appendToBody: true },
    series: [{
      type: 'sankey',
      left: 60, right: 60, top: 20, bottom: 20,
      nodeWidth: 20,
      nodeGap: 14,
      layoutIterations: 0,
      emphasis: { focus: 'adjacency' },
      nodeAlign: 'left',
      lineStyle: { color: 'gradient', curveness: 0.5, opacity: 0.3 },
      label: { color: ink, fontSize: 12 },
      data: [
        { name: '公网访问', itemStyle: { color: accent } },
        { name: '产品页浏览', itemStyle: { color: accent } },
        { name: '免费体验', itemStyle: { color: accent2 } },
        { name: '点击购买', itemStyle: { color: accent2 } },
        { name: '支付弹窗', itemStyle: { color: accent2 } },
        { name: '扫码支付', itemStyle: { color: green } },
        { name: '确认交付', itemStyle: { color: green } },
        { name: '内容呈现', itemStyle: { color: green } },
        { name: '重复购买', itemStyle: { color: accent } }
      ],
      links: [
        { source: '公网访问', target: '产品页浏览', value: 100 },
        { source: '产品页浏览', target: '免费体验', value: 40 },
        { source: '产品页浏览', target: '点击购买', value: 60 },
        { source: '点击购买', target: '支付弹窗', value: 60 },
        { source: '支付弹窗', target: '扫码支付', value: 60 },
        { source: '扫码支付', target: '确认交付', value: 60 },
        { source: '确认交付', target: '内容呈现', value: 60 },
        { source: '内容呈现', target: '重复购买', value: 20 },
        { source: '免费体验', target: '点击购买', value: 25 }
      ]
    }]
  });
  window.addEventListener('resize', function() { chart1.resize(); });
})();
