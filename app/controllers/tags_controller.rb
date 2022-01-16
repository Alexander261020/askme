class TagsController < ApplicationController
  def show
    if Tag.exists?(text: params[:id])
      @tag = Tag.where(text: params[:id]).first
      @questions = @tag.questions
    else
      redirect_to root_path, notice: "Хештег #{params[:id]} не обнаружен!"
    end
  end
end
