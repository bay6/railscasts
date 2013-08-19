require 'spec_helper'

describe Episode do
  it "validates presence of name" do
    build(:episode, name: "").should have(1).errors_on(:name)
  end

  it "validates presence of description" do
    build(:episode, description: "").should have(1).errors_on(:description)
  end

  it "scopes published episodes", :focus do
    published = create(:episode, published_on: 2.days.ago)
    unpublished = create(:episode, published_on: 2.days.from_now)
    Episode.published.should eq([published])
  end

end
