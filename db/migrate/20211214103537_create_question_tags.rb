class CreateQuestionTags < ActiveRecord::Migration[6.1]
  def change
    create_table :question_tags do |t|
      t.belongs_to :question
      t.belongs_to :tag
    end
  end
end
