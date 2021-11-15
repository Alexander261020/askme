class AddUserToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :user, null: false, foreign_key: true
    # add_reference :questions, :user, index: true, foreign_key: true
  end
end
