class FormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  def index
    @forms = Form.all
  end

  def show
  end

  def new
    @form = current_user.forms.build
    @categories = Category.all # Para mostrar categorías disponibles
  end

  def create
    @form = current_user.forms.build(form_params)

    if @form.save
      # Guardar las categorías asociadas
      @form.category_ids = params[:form][:category_ids].reject(&:blank?)
      redirect_to forms_path, notice: "Formulario creado con éxito."
    else
      @categories = Category.all # Para volver a mostrar las categorías si hay un error
      render :new, alert: "Hubo un error al crear el formulario."
    end
  end

  def edit
    redirect_to forms_path, alert: "No tienes permiso para editar este formulario." unless @form.user == current_user
    @categories = Category.all # Para mostrar categorías disponibles en la edición
  end

  def update
    if @form.user == current_user && @form.update(form_params)
      # Actualizar las categorías asociadas
      @form.category_ids = params[:form][:category_ids].reject(&:blank?)
      redirect_to forms_path, notice: "Formulario actualizado con éxito."
    else
      @categories = Category.all # Para volver a mostrar las categorías si hay un error
      render :edit, alert: "Hubo un error al actualizar el formulario."
    end
  end

  def destroy
    if @form.user == current_user
      @form.destroy
      redirect_to forms_path, notice: "Formulario eliminado con éxito."
    else
      redirect_to forms_path, alert: "No tienes permiso para eliminar este formulario."
    end
  end

  private

  def set_form
    @form = Form.find(params[:id])
  end

  def form_params
    params.require(:form).permit(:title, :description, category_ids: [], question_ids: [], questions_attributes: [:content, :question_type, options_attributes: [:content]])
  end
end
