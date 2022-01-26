class TagsController < ApplicationController
  def show
    @tag = Tag.load_questions.find_by!(text: params[:text])
    @questions = @tag.questions.includes(:author, :user, :tags)
  end
end
