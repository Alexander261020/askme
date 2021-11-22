require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        create: "Create",
        edit: "Edit",
        update: "Update",
        destroy: "Destroy"
      ),
      Question.create!(
        create: "Create",
        edit: "Edit",
        update: "Update",
        destroy: "Destroy"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", text: "Create".to_s, count: 2
    assert_select "tr>td", text: "Edit".to_s, count: 2
    assert_select "tr>td", text: "Update".to_s, count: 2
    assert_select "tr>td", text: "Destroy".to_s, count: 2
  end
end
