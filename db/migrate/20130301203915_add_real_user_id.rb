class AddRealUserId < ActiveRecord::Migration
  def up
      change_table :stories do |t|
          t.references :user
      end
  end

  def down
  end
end
