class AddCompleteBooleanToStories < ActiveRecord::Migration
  def change
      change_table :stories do |t|
          t.boolean :complete
      end
  end
end
