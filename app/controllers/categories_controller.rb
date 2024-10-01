class CategoriesController < ApplicationController
  # Método para obtener las preguntas asociadas a una categoría
  def questions
    @category = Category.find(params[:id])
    @questions = @category.questions # Asegúrate de que la relación esté definida en el modelo Category

    respond_to do |format|
      format.json { render json: @questions }
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Categoría no encontrada' }, status: :not_found
  end
end
