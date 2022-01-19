class TagsController < ApplicationController
  def show
    if Tag.exists?(text: params[:text])
      @tag = Tag.where(text: params[:text]).first
      @questions = @tag.questions.includes(:tags)
    else
      render404
    end
  end
end
