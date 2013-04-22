class Story < ActiveRecord::Base
  attr_accessible :title, :max_sentences, :total_slices, :complete, :user_id, :slices_attributes

  validates :title, :presence => true
  validates :total_slices, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 2,  :less_than => 99 }
  validates :max_sentences, :presence => true, :numericality => { :only_integer => true, :less_than => 15 }

  belongs_to :user, :touch => true
  has_many :slices, :dependent => :destroy
  has_many :users, :through => :slices

  accepts_nested_attributes_for :slices, :allow_destroy => :true, :reject_if => proc { |attrs| attrs[:body].blank? }, :limit => 1

  def slices_left
      total_slices - slices.length
  end

  def slices_done
      slices.length  % total_slices
  end

  def done?
      complete || done_by_count?
  end

  def can_have_slice_by(user)
      if  users.last and user.id == slices.last.user.id
          false
      else
          true
      end
  end

  def last_two_slices
      last_part = []
      slices.order('created_at DESC').limit(2).each do |slice|
          last_part << slice.body
      end
      last_part.reverse.join
  end

  def contributors
      if self.slices.empty?
          [] << self.user
      else
          self.users.unshift(self.user).uniq
      end
  end

  def self.complete_story(story, type=:full)
      complete_story = []

      if type == :excerpt
          story.slices.each do |slice|
              complete_story << slice.body
          end
      else
          story.slices.each do |slice|
              complete_story << "<a href='#' class='slice' id='user_#{slice.user.id}'>#{slice.body}</a>"
          end
      end

      complete_story.join(" ")
  end

  def self.list(state, limit=nil)
      if limit.nil?
          Story.where("complete = ?", state).order('created_at DESC')
      else
          Story.where("complete = ?", state).limit(limit).order('created_at DESC')
      end
  end

  def generate_slice_bar(width)
      ratio = ((slices_done.to_f / total_slices.to_f) * 100).to_i
      markup = "<div class='slicebar' style='width:#{width}%;'><div class='slice-percentage' style='width:#{ratio}%;'></div></div>"
  end

  private

  def done_by_count?
      if slices.length >= total_slices
          true
      else
          false
      end
  end

end
