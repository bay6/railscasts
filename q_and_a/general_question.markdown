#### assets pipe line

* question 1

If you have a image menu.png under app/assets/images/menu.png

What should you write for image_tag and img in html and css

```ruby
<%= image_tag menu.png%>

<img src="assets/menu.png" alt="Smiley menu" height="42" width="42">
# need to change the file name from .scss to .scss.erb
background-image:url(<%=asset_path "menu.png"%>);
```
