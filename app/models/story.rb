class Story < ActiveRecord::Base
  attr_accessible :title, :max_sentences, :total_slices

  validates :title, :presence => true

  belongs_to :user
  has_many :slices
  has_many :users, :through => :slices

  def slices_left
      total_slices - slices.length
  end

  def done?
      slices_left <= 0
  end

  def can_have_slice_by(user)
      if user.id == users.last.id
          false
      else
          true
      end
  end

end
