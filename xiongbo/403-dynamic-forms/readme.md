# rails casts practices -- 403 dynamic forms

## resources
1. [object of ActionView::Helper](apidock.com/rails/ActionView/Helpers/ActiveModelInstanceTag/object)

2. [klass](apidock.com/rails/ActiveRecord/Reflection/AssociationReflection/klass)

## code tips

```javascript
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  //this is used for generate different id for field
  $(this).before($(this).data('fields').replace(regexp, time))
```

  


