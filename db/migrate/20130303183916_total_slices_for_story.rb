class TotalSlicesForStory < ActiveRecord::Migration
  def up
      change_table :stories do |t|
          t.integer :total_slices, :default => 7
      end
      Story.update_all ["total_slices = ?", 7]
  end

  def down
  end
end
