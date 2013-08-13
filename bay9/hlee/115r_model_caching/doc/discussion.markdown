### Rails Cache & Rails Cache

* touch

```ruby
class Comment < ActiveRecord::Base
  belongs_to :article, touch: true
  attr_accessible :name, :content
end
```
