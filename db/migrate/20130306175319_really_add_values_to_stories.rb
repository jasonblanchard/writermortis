class ReallyAddValuesToStories < ActiveRecord::Migration
  def up
      Story.all.each do |story|
          if story.slices.count >= story.total_slices
              story.complete = true
              story.save
          else
              story.complete = false
              story.save
          end 
      end 
  end

  def down
  end
end
