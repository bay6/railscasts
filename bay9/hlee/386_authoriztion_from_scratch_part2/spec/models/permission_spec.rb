require "spec_helper"

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end

describe Permission do
  describe "as guest" do
    subject { Permission.new(nil) }

    it { should allow("topics", "index") }
    it { should allow("topics", "show") }
    it { should_not allow("topics", "new") }
    it { should_not allow("topics", "create") }
    it { should_not allow("topics", "edit") }
    it { should_not allow("topics", "update") }
    it { should_not allow("topics", "destroy") }

    it { should allow("sessions", "new") }
    it { should allow("sessions", "create") }
    it { should allow("sessions", "destroy") }

    it { should allow("users", "new") }
    it { should allow("users", "create") }
    it { should_not allow("users", "edit") }
    it { should_not allow("users", "update") }
  end

  describe "as admin" do
    subject { Permission.new(build(:user, admin: true)) }

    it { should allow("anything", "here") }
  end

  describe Permission do
    # Specs for guests and admins omitted.

    describe "as member" do
      let(:user) { create(:user, admin: false) }
      let(:user_topic) { build(:topic, user: user) }
      let(:other_topic) { build(:topic) }

      subject { Permission.new(user) }

      it { should_not allow("topics", "edit") }
      it { should_not allow("topics", "update") }
      it { should_not allow("topics", "edit", other_topic) }
      it { should_not allow("topics", "update", other_topic) }
      it { should allow("topics", "edit", user_topic) }
      it { should allow("topics", "update", user_topic) }

      # Specs for other actions omitted.
    end
  end
end
