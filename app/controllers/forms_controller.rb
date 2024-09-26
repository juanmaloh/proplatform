class FormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  def index
    @forms = Form.all # Muestra todos los formularios sin importar el usuario
  end

  def show
    # Permitir que cualquier usuario vea un formulario específico
  end

  def new
    @form = current_user.forms.build # Inicializa un nuevo formulario asociado al usuario actual
  end

  def create
    @form = current_user.forms.build(form_params) # Crea un nuevo formulario con los parámetros permitidos

    if @form.save
      redirect_to forms_path, notice: "Formulario creado con éxito."
    else
      render :new, alert: "Hubo un error al crear el formulario."
    end
  end

  def edit
    # Solo el propietario del formulario puede editarlo
    redirect_to forms_path, alert: "No tienes permiso para editar este formulario." unless @form.user == current_user
  end

  def update
    if @form.user == current_user && @form.update(form_params)
      redirect_to forms_path, notice: "Formulario actualizado con éxito."
    else
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
    @form = Form.find(params[:id]) # Encuentra el formulario sin limitarlo al usuario actual
  end

  def form_params
    params.require(:form).permit(:title, :description, :fields) # Permitir estos parámetros
  end
end
