jQuery ->
  Morris.Line
    element: 'orders_chart'
    data: $('#orders_chart').data('orders')
    xkey: 'y'
    ykeys: ['a']
    labels: ['Series A']
