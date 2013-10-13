require "spec_helper"

describe Permission, focus: true do
  describe "as guest" do
    subject { Permission.new(nil) }
    it { should allow("topics", "index") }
    it { should_not allow("topics", "show") }
    it { should_not allow("topics", "new") }
    it { should_not allow("topics", "create") }
    it { should_not allow("topics", "edit") }
    it { should_not allow("topics", "update") }
    it { should_not allow("topics", "destroy") }
  end
end

describe "as admin" do
  subject { Permission.new(build(:user, admin: true)) }
  it { should allow("topics", "index") }
  it { should allow("topics", "show") }
  it { should allow("topics", "new") }
  it { should allow("topics", "create") }
  it { should allow("topics", "edit") }
  it { should allow("topics", "update") }
  it { should allow("topics", "destroy") }
end

describe "as member" do
  subject { Permission.new(build(:user, admin: false)) }
  it { should allow("topics", "index") }
  it { should allow("topics", "show") }
  it { should allow("topics", "new") }
  it { should allow("topics", "create") }
  it { should allow("topics", "edit") }
  it { should allow("topics", "update") }
  it { should_not allow("topics", "destroy") }
end
