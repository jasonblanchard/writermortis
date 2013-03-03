class CreateSlice < ActiveRecord::Migration
  def change
    create_table :slice do |t|
      t.text :body
      t.references :story
      t.references :user

      t.timestamps
    end
    add_index :slice, :story_id
    add_index :slice, :user_id
  end
end
