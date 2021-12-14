class AddColorToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :color, :string, null: true
  end
end
