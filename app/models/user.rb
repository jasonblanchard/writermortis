class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :name

  validates :name, :presence => true, :uniqueness => true

  has_many :stories
  has_many :slices

  before_destroy :change_contributions_to_anon

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

  def change_contributions_to_anon
      anon = User.find_by_name('anon').id
      if (self.slices.length > 0)
          self.slices.update_all(:user_id => anon)
      end
      
      if (self.stories.length > 0)
          self.stories.update_all(:user_id => anon)
      end
  end

end
