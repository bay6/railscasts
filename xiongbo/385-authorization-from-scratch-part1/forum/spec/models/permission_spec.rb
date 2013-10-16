require "spec_helper"

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end

describe Permission do
  describe "as guest" do
    subject { Permission.new(nil) }
    it { should allow "topics", "index" }
    it { should allow "topics", "show" }
    it { should_not allow "topics", "new" }
    it { should_not allow "topics", "create" }
    it { should_not allow "topics", "edit" }
    it { should_not allow "topics", "update" }
    it { should_not allow "topics", "destroy" }
  end
end
