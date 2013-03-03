class Story < ActiveRecord::Base
  attr_accessible :title, :max_sentences, :total_slices

  validates :title, :presence => true

  belongs_to :user
  has_many :slices
end
