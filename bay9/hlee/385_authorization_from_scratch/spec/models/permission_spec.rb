require "spec_helper"

describe Permission, focus: true do
  describe "as guest" do
    subject { Permission.new(nil) }
    it { should allow("topics", "index") }
  end
end
