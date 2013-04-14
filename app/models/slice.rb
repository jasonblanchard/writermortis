class Slice < ActiveRecord::Base
  belongs_to :story, :touch => true
  belongs_to :user
  attr_accessible :body, :user_id

  validates :body, :presence => true, :if => :skip_slice_validation?
  validate :does_not_excede_max_sentences

  after_save :update_story_status
  after_destroy :update_story_status

  def does_not_excede_max_sentences
      if !body.blank? && story
        sentences = body.split(/([^\r\n.!?]+([.!?]+|$))/)
        sentences.keep_if { |i| i =~ /\w/ }
        max_sentences = self.story.max_sentences

        if sentences.length > self.story.max_sentences
            errors.add(:body, " must have less than #{max_sentences} sentences.")
        end
      end
  end

  private

    def update_story_status
        if self.story.slices.length >= self.story.total_slices
            self.story.update_attributes(:complete => true)
        else
            self.story.update_attributes(:complete => false)
        end
    end 

    def skip_slice_validation?
        !defined? params[:force_slice_submit]
    end

end
