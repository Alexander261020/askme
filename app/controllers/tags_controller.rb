class TagsController < ApplicationController
  def show
    @tag = Tag.with_questions.find_by!(text: params[:text])
    @questions = @tag.questions.includes(:author, :user, :tags)
  end
end
