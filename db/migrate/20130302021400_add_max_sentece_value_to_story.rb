class AddMaxSenteceValueToStory < ActiveRecord::Migration
  def change
      change_table :stories do |t|
          t.integer :max_sentences, :default => 5
      end
  end
end
