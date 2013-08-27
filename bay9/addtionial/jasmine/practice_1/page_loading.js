var page = require('webpage').create();
page.open('http://example.com', function() {
    page.render('images/example.png')
    phantom.exit();
});