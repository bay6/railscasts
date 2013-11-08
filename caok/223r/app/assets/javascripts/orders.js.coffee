jQuery ->
  Morris.Line
    element: 'orders_chart'
    data: $('#orders_chart').data('orders')
    xkey: 'purchased_at'
    ykeys: ['price']
    labels: ['Price']
