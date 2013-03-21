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

    describe "can return users who contributed to the story" do
        it "returns contributors when story has slices" do
            user = FactoryGirl.create(:user)
            user1 = FactoryGirl.create(:user, :email => 'sally@example.com', :id => 2, :name => "Sallywally")
            story = FactoryGirl.create(:story)
            slice = FactoryGirl.create(:slice, :user_id => 2)

            story.contributors.length.should equal(2)
            story.contributors[0].id.should equal(1)
        end

        it "returns author only when story has no slices" do
            user = FactoryGirl.create(:user)
            story = FactoryGirl.create(:story)

            story.contributors.length.should equal(1)
            story.contributors[0].id.should equal(1)
        end
    end

    describe "can display a complete story" do
        it "returns text for a completed story" do
            user = FactoryGirl.create(:user)
            story = FactoryGirl.create(:story)
            slice1 = FactoryGirl.create(:slice, :user_id => 1, :body => "Once upon a time there was a pig.")
            slice2 = FactoryGirl.create(:slice, :user_id => 1, :body => "And he was eaten by a coyote.")

            expect(Story.complete_story(story)).to eq("<span id='user_1'>Once upon a time there was a pig.</span> <span id='user_1'>And he was eaten by a coyote.</span>")
        end
    end

    describe "can show lists of stories" do

        it "by returning a list of all complete stories" do
            
            5.times do
                FactoryGirl.create(:story, :complete => true)
            end

            Story.story_list(true).length.should eq(5)
        end

        it "by returning a list of all incomplete stories" do
            5.times do
                FactoryGirl.create(:story)
            end

            Story.story_list(false).length.should eq(5)
        end

        it "by returning a limited list of complete stories" do
            10.times do
                FactoryGirl.create(:story, :complete => true)
            end

            Story.story_list(true,3).length.should eq(3)
        end
    end
end
