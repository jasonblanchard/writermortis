require "spec_helper"

describe Story do
    it "knows when the story is finished" do
        story = Story.create!(:title => "Test Story")

        story.done? should.be false
        puts story.done?
    end
end
