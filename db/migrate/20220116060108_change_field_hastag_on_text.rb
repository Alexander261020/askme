class ChangeFieldHastagOnText < ActiveRecord::Migration[6.1]
  def change
    rename_column :tags, :hashtag, :text
  end
end
