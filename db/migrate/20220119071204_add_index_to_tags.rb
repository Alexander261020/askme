class AddIndexToTags < ActiveRecord::Migration[6.1]
  change_table :tags do |t|
    t.index :text, :unique => true
  end
end
