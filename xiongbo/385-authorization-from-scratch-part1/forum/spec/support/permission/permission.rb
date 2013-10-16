require "spec_helper"

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end
