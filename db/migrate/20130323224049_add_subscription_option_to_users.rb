class AddSubscriptionOptionToUsers < ActiveRecord::Migration
  def change
      change_table :users do |t|
          t.boolean :receive_emails, :default => true
      end
  end
end
