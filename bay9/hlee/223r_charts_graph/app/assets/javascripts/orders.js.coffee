# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Morris.Line
    element: 'annual'
    data: [
      {y: '2012', a: 100}
      {y: '2011', a: 75}
      {y: '2010', a: 50}
      {y: '2009', a: 75}
      {y: '2008', a: 50}
      {y: '2007', a: 75}
      {y: '2006', a: 100}
    ]
    xkey: 'y'
    ykeys: ['a']
    labels: ['Series a']
