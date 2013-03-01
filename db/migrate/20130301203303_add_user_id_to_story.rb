class AddUserIdToStory < ActiveRecord::Migration
  def change
      change_table :stories do |t|
          t.references :users
      end
  end
end
