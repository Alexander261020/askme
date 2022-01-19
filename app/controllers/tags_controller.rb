class TagsController < ApplicationController
  def show
    @tag = Tag.where(text: params[:id]).first
    @questions = @tag.questions
  end
end
