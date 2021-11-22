require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      create: "MyString",
      edit: "MyString",
      update: "MyString",
      destroy: "MyString"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[create]"

      assert_select "input[name=?]", "question[edit]"

      assert_select "input[name=?]", "question[update]"

      assert_select "input[name=?]", "question[destroy]"
    end
  end
end
