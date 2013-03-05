require "spec_helper"

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
        it "won't let user add two slices in a row"
        it "will let a different user add a slice"
    end

end
