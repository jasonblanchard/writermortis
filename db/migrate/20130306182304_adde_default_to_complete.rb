class AddeDefaultToComplete < ActiveRecord::Migration
  def up
      change_column :stories, :complete, :boolean, :default => false
  end

  def down
  end
end
