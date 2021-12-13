class CreateQuestionsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :questions_tags do |t|
      t.belongs_to :question
      t.belongs_to :tag
    end
  end
end
