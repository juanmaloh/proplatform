class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: [:new, :create]

  def new
    @submission = @form.submissions.build
  end

  def create
    @submission = @form.submissions.build(submission_params)
    @submission.user = current_user

    if @submission.save
      redirect_to forms_path, notice: "Respuestas enviadas con éxito."
    else
      render :new, alert: "Hubo un error al enviar las respuestas."
    end
  end

  private

  def set_form
    @form = Form.find(params[:form_id])
  end

  def submission_params
    params.require(:submission).permit(responses: {})
  end
end
