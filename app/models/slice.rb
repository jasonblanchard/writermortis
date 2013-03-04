class Slice < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  attr_accessible :body

  validates :body, :presence => true
end
