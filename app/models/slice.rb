class Slice < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  attr_accessible :body

  validates :body, :presence => true
  validate :does_not_excede_max_sentences

  def does_not_excede_max_sentences
      if !body.blank?
        sentences = body.split(/((?<=[a-z0-9)][.?!])|(?<=[a-z0-9][.?!]"))\s+(?="?[A-Z])/)
        sentences.delete("")
        max_sentences = self.story.max_sentences

        if sentences.length > self.story.max_sentences
            errors.add(:body, " must have less than #{max_sentences} sentences.")
        end
      end
  end

end
