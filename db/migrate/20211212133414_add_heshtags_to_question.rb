class AddHeshtagsToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :tags, :string, array: true, default: []
  end
end
