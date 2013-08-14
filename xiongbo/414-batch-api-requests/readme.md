# Rails casts --414 Batch API Requests

## resources
[rack spec](http://rack.rubyforge.org/doc/SPEC.html)
[stringify](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify)

## pay attention to
1. env.inspect
2. rack.input
3. StringIO
4. request = Rack.Request.new(env.deep_dup)
