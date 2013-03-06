class UpdateCompleteStories < ActiveRecord::Migration
  def up
      Story.all.each do |story|
          if story.slices.count >= story.total_slices
              story.complete = true
          else
              story.complete = false
          end
      end
  end

  def down
  end
end
