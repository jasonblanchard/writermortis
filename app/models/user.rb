class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :name

  validates :name, :presence => true

  has_many :stories
  has_many :slices

  def has_contributed_to_finished
      stories = []

      self.slices.order('created_at DESC').each do |slice|
          stories << slice.story if slice.story.done?
      end

      stories.uniq
  end

  def has_contributed_to_unfinished
      stories = []

      self.slices.order('created_at DESC').each do |slice|
          stories << slice.story if !slice.story.done?
      end

      stories.uniq
  end

end
