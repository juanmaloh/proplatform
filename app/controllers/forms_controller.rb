class FormsController < ApplicationController
  before_action :authenticate_user!

  def index
    @forms = current_user.forms # Muestra solo los formularios del usuario autenticado
  end

  def new
    @form = current_user.forms.build # Inicializa un nuevo formulario asociado al usuario actual
  end

  def create
    @form = current_user.forms.build(form_params) # Crea un nuevo formulario con los parámetros permitidos

    if @form.save
      redirect_to forms_path, notice: "Formulario creado con éxito." # Redirige a la lista de formularios
    else
      render :new, alert: "Hubo un error al crear el formulario."
    end
  end

  def show
    @form = current_user.forms.find(params[:id]) # Encuentra el formulario específico del usuario autenticado
  end
  

  private

  def form_params
    params.require(:form).permit(:title, :description, :fields) # Permitir estos parámetros
  end
end
