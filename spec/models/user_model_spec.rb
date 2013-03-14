require "spec_helper"

describe User do
    it "should create a user" do
        user = FactoryGirl.create(:user)

        expect(user.class.to_s.should).to eq('User')
    end

    describe "should return a users contributions" do
        it "by showing unfinished stories a user contributed to"
    end
end
