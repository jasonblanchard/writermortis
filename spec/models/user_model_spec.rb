require "spec_helper"

describe User do 
    describe "it can return stories a user has worked on" do
        user = FactoryGirl.create(:user, :email => 'blarg@eample.com')
        complete_story = FactoryGirl.create(:story)
        #incomplete_story = FactoryGirl.create(:story, :complete => false)

        it "returns unfinished stories" do
            user.has_contributed_to_finished.length.should equal(1)
        end

        it "returns finished stories" do
            user.has_contributed_to_unfinished.length.should equal(1)
        end
    end
end
