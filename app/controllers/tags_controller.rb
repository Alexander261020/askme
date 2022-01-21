class TagsController < ApplicationController
  def show
    @tag = Tag.includes(:questions).find_by_text! params[:text]
    @questions = @tag.questions.includes(:author)
  end
end
