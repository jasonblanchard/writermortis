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
    describe "won't let a user add two slices in a row" do
        it "by knowing if a user has posted last" do
            user = FactoryGirl.create(:user, :id => 1)
            story = FactoryGirl.create(:story, :id => 1)
            slice = FactoryGirl.create(:slice, :story_id => 1, :user_id => 1)

            story.can_have_slice_by(user).should by_false
        end

        it "will not submit a second slice from same user" do
            user = FactoryGirl.create(:user, :id => 1)
            story = FactoryGirl.create(:story, :id => 1, :user_id => 1)
            slice1 = FactoryGirl.create(:slice, :user_id => 1, :story_id => 1)
            slice2 = FactoryGirl.create(:slice, :user_id => 1, :story_id => 1)

            errors = slice2.errors.any?
            errors.should be_true

        end

        it "will submit slice from second user" do
            user1 = FactoryGirl.create(:user, :id => 1)
            user2 = FactoryGirl.create(:user, :id => 2, :email => 'sally@example.com')
            story = FactoryGirl.create(:story, :id => 1, :user_id => 1)
            slice1 = FactoryGirl.create(:slice, :user_id => 1, :story_id => 1)
            slice2 = FactoryGirl.create(:slice, :user_id => 2, :story_id => 1)

            errors = slice2.errors.any?
            errors.should be_false
        end

    end

end
