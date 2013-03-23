require "spec_helper"

describe User do
    it "should create a user" do
        user = FactoryGirl.create(:user)

        expect(user.class.to_s.should).to eq('User')
    end

    describe "should return a users contributions" do
        it "by showing unfinished stories a user contributed to" do 
            user = FactoryGirl.create(:user)
            story = FactoryGirl.create(:story)

            user.has_contributed_to_unfinished.length.should be(1)
        end

        it "by showing finished stories a user contributed to" do
            user = FactoryGirl.create(:user)
            story = FactoryGirl.create(:story, :complete => true)

            user.has_contributed_to_finished.length.should be(1)
        end
    end

    describe "deleting a user" do
        it "should change slice users to anon" do
            anon = FactoryGirl.create(:user, :email => 'anon@devnul.com', :name => 'anon')
            user = FactoryGirl.create(:user)
            story = FactoryGirl.create(:story)
            slice = FactoryGirl.create(:slice, :user_id => user.id)

            slice.user.id.should be(user.id)

            user.destroy

            slice = Slice.find(slice.id)

            slice.user.id.should be(anon.id)
        end

        it "should change story users to anon" do
            anon = FactoryGirl.create(:user, :email => 'anon@devnul.com', :name => 'anon')
            user = FactoryGirl.create(:user)
            story = FactoryGirl.create(:story)

            user.destroy

            story = Story.find(story.id)

            story.user.id.should be(anon.id)
        end
    end
end
