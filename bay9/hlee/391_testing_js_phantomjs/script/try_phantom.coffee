page = require('webpage').create()
page.open 'http://localhost:3000', (status) -> 
  console.log "Status: #{status}"
    phantom.exit()