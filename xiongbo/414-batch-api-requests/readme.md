# Rails casts --414 Batch API Requests

## resources
[rack spec](http://rack.rubyforge.org/doc/SPEC.html)

## pay attention to
1. env.inspect
2. rack.input
3. StringIO
4. request = Rack.Request.new(env.deep_dup)
