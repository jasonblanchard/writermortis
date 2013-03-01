class RemoveUsersAttr < ActiveRecord::Migration
  def up
      change_table :stories do |t|
          t.remove :users
      end
  end

  def down
  end
end
