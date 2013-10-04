page = require('webpage').create()
page.open 'http://localhost:3000', (status) ->
  title = page.evaluate -> document.title
  console.log "Status: #{title}"
  phantom.exit()
