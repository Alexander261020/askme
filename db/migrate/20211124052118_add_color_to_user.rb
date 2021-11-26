class AddColorToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :color, :integer
  end
end
