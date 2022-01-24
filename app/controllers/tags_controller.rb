class TagsController < ApplicationController
  def show
    @tag = Tag.find_by!(text: params[:text])
    @questions = @tag.questions.includes(:author, :user, :tags)
  end
end
