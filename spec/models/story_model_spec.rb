require "spec_helper"
FactoryGirl.find_definitions

describe Story do
    it "knows when the story is finished" do
        story = Story.create!(:title => "Test Story")

        status = story.done?
        status.should be_false
    end

    it "knows how many more slices if needs" do
        story = Story.create!(:title => "Test Story")
        slices_left = story.slices_left

        slices_left.should equal(story.total_slices)
    end

    describe "will control who can post" do
        it "by knowing if a user has posted last" do
            user = FactoryGirl.create(:user)
            story = FactoryGirl.create(:story)
            slice = FactoryGirl.create(:slice)

            story.can_have_slice_by(user).should be_false
        end

        it "but let people make a first post" do
            user = FactoryGirl.create(:user)
            story = FactoryGirl.create(:story)

            story.can_have_slice_by(user).should be_true
        end

    end

    it "can return users who contributed to the story" do
        user = FactoryGirl.create(:user)
        user1 = FactoryGirl.create(:user, :email => 'sally@example.com', :id => 2)
        story = FactoryGirl.create(:story)
        slice = FactoryGirl.create(:slice, :user_id => 2)

        story.contributors.length.should equal(2)
        story.contributors[0].id.should equal(1)
    end

end
