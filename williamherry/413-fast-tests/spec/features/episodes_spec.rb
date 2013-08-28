require 'spec_helper'

describe "Episodes" do
  it "lists published episodes" do
    create(:episode, name: "Blast from the Past", published_on: 2.days.ago)
    create(:episode, name: "Back to the Future", published_on: 2.days.from_now)
    visit episodes_path
    page.should have_content("Blast from the Past")
    page.should_not have_content("Back to the Future")
  end

  it "shows episode details" do
    episode = create(:episode, name: "Hello World", description: "Lorem ipsum", published_on: "2013-04-06")
    visit episode_path(episode)
    page.should have_content("Lorem ipsum")
    page.should have_content("April 6, 2013")
  end

  it "creates episode" do
    visit episodes_path
    click_on "New Episode"
    click_on "Create"
    page.should have_content("errors prohibited this")
    fill_in "Name", with: "Blast from the Past"
    fill_in "Description", with: "Hello world"
    fill_in "Duration (timecode)", with: "15:23"
    click_on "Create"
    current_path.should eq(episode_path(Episode.last))
    page.should have_content("Blast from the Past")
    page.should have_content("15 minutes")
  end

  it "updates episode" do
    episode = create(:episode, name: "Blast from the Past")
    visit episode_path(episode)
    click_on "Edit"
    fill_in "Name", with: ""
    click_on "Update"
    page.should have_content("error prohibited this")
    fill_in "Name", with: "Back to the Future"
    click_on "Update"
    current_path.should eq(episode_path(Episode.last))
    page.should have_content("Back to the Future")
  end
  
  it "destroys episode" do
    episode = create(:episode, name: "Hello World")
    visit episode_path(episode)
    click_on "Destroy"
    page.should have_content("Episode was successfully destroyed")
    page.should_not have_content("Hello World")
  end
end
