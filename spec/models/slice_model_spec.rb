require "spec_helper"

describe Slice do
    it "should reject slice with a body that exedes the story max sentences" do
        story = Story.create!(:title => "Test Story", :max_sentences => 3)
        slice = story.slices.create(:body => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.")

        slice.valid?

        expect(slice.errors.messages[:body]).to eq([" must have less than 3 sentences."])
    end

    it "should not reject slice with a body that is under or equal to the story max sentences" do
        story = Story.create!(:title => "test story", :max_sentences => 10)
        slice = story.slices.create(:body => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.")

        validation = slice.valid?

        validation.should be_true
        
    end

end
