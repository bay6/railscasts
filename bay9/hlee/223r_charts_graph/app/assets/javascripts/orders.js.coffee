# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Morris.Line
    element: 'orders_chart'
    data: $('#orders_chart').data('orders')
    xkey: 'purchased_at'
    ykeys: ['price', 'shipping_price', 'download_price']
    labels: ['Total Price', 'Shipping Price', 'Download Price']
    preUnits: '$'
