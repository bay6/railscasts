
RSpec::Matchers.define :allowha do |*args|
  match do |permission|
    permission.allow?(*args)
  end
end
