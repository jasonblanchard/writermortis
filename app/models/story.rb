class Story < ActiveRecord::Base
  attr_accessible :title, :max_sentences, :total_slices

  validates :title, :presence => true

  belongs_to :user
  has_many :slices

  def slices_left
      total_slices - slices.length
  end

  def done?
      total_slices == 0
  end
end
