jQuery ->
  Morris.Line
    element: 'orders_chart'
    data: $('#orders_chart').data('orders')
    xkey: 'purchased_at'
    ykeys: ['price', 'shipping_price', 'download_price']
    labels: ['Total Price', 'Shipping Price', 'Download Price']
    preUnits: "$"
