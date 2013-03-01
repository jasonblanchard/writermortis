class RemoveColumnsFromUser < ActiveRecord::Migration
  def up
      change_table :users do |t|
          t.remove :email
          t.remove :name
      end
  end

  def down
  end
end
