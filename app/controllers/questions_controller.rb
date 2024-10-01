class QuestionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @questions = @category.questions

    respond_to do |format|
      format.json { render json: @questions }
    end
  end
end
