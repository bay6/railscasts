
RSpec::Matchers.define :allowha do |*args|
  match do |permission|
    permission.allow?(*args)
  end
end

Rspec::Matchers.define :allowha_param do |*args|
  match do |permission|
    permission.allow_param? *args
  end
end
