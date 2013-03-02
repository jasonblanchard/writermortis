class RemoveExtraColumn < ActiveRecord::Migration
  def up
        remove_column :stories, :users_id
  end

  def down
  end
end
