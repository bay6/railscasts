
RSpec::Matchers.define :allowha do |controller, action|
  match do |permission|
    permission.allow?(controller, action)
  end
end
