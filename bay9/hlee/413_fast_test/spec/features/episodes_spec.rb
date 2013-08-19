require 'spec_helper'

describe "Episodes" do
  it ' lists published episode ' do
    create(:episode, name: "Blast from the Past", published_on: 2.days.ago)
    create(:episode, name: "Back to the Future", published_on: 2.days.from_now)
    visit episodes_path
    page.should have_content("Blast from the Past")
    page.should_not have_content("Back to the Future")
  end

  it "includes content" do
    episode = create(:episode, name: "Hello World", description: "Lorem ipsum", published_on: "2013-04-06")
    visit episode_path(episode)
    page.should have_content("Lorem ipsum")
    page.should have_content("April 6, 2013")
  end

  describe "create action" do
    before(:each) do
      visit episodes_path
      click_on "New Episode"
    end

    it "requires name" do
      click_on "Create"
      page.should have_content("Name can't be blank")
    end

    it "requires description" do
      click_on "Create"
      page.should have_content("Description can't be blank")
    end

    describe "with valid episode" do
      before(:each) do
        fill_in "Name", with: "Blast from the Past"
        fill_in "Description", with: "Hello world"
        fill_in "Duration (timecode)", with: "15:23"
        click_on "Create"
      end

      it "says the record was created" do
        page.should have_content("Episode was successfully created")
      end

      it "redirects to show page" do
        current_path.should eq(episode_path(Episode.last))
      end

      it "has updated title" do
        page.should have_content("Blast from the Past")
      end

      it "has minutes" do
        page.should have_content("15 minutes")
      end
    end
  end

  describe "update action" do
    before(:each) do
      episode = create(:episode, name: "Blast from the Past")
      visit episode_path(episode)
      click_on "Edit"
    end

    describe "with valid episode" do
      before(:each) do
        fill_in "Name", with: "Back to the Future"
        click_on "Update"
      end

      it "redirects to show page" do
        current_path.should eq(episode_path(Episode.last))
      end

      it "says the record was updated" do
        page.should have_content("Episode was successfully updated")
      end

      it "has updated title" do
        page.should have_content("Back to the Future")
      end
    end
  end

  describe "destroy action" do
    before(:each) do
      episode = create(:episode, name: "Hello World")
      visit episode_path(episode)
      click_on "Destroy"
    end

    it "says the record was destroyed" do
      page.should have_content("Episode was successfully destroyed")
    end

    it "removes the record" do
      page.should_not have_content("Hello World")
    end
  end
end
