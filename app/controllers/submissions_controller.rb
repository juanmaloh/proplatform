class SubmissionsController < ApplicationController
  before_action :set_form, only: [:new, :create]
  before_action :authenticate_user!

  def new
    @submission = @form.submissions.build
    @questions = @form.questions # Cargar las preguntas del formulario para mostrarlas en la vista
  end

  def create
    @submission = @form.submissions.build(submission_params)
    @submission.user = current_user

    if @submission.save
      redirect_to form_path(@form), notice: "Respuestas enviadas correctamente."
    else
      @questions = @form.questions
      render :new_response, alert: "Hubo un error al enviar las respuestas."
    end
  end

  private

  def set_form
    @form = Form.find(params[:form_id]) # Cargar el formulario asociado
  end

  def submission_params
    params.require(:submission).permit(:form_id, responses_attributes: [:question_id, :answer])
  end
end
