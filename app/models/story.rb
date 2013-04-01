class Story < ActiveRecord::Base
  attr_accessible :title, :max_sentences, :total_slices, :complete, :user_id, :slices_attributes

  validates :title, :presence => true
  validates :total_slices, :presence => true, :numericality => { :only_integer => true, :less_than => 99 }
  validates :max_sentences, :presence => true, :numericality => { :only_integer => true, :less_than => 15 }

  belongs_to :user
  has_many :slices, :dependent => :destroy
  has_many :users, :through => :slices

  accepts_nested_attributes_for :slices, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

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
      if  users.last and user.id == users.last.id
          false
      else
          true
      end
  end

  def contributors
      if self.slices.empty?
          [] << self.user
      else
          self.users.unshift(self.user).uniq
      end
  end

  def self.complete_story(story)
      complete_story = []

      story.slices.each do |slice|
          complete_story << "<div class='slice inline' id='user_#{slice.user.id}'>#{slice.body}</div>"
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
