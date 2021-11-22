require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      create: "Create",
      edit: "Edit",
      update: "Update",
      destroy: "Destroy"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Create/)
    expect(rendered).to match(/Edit/)
    expect(rendered).to match(/Update/)
    expect(rendered).to match(/Destroy/)
  end
end
