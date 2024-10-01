class Response < ApplicationRecord
  belongs_to :submission # Asociación con el envío (submission) del formulario
  belongs_to :question # La pregunta a la que se está respondiendo
  belongs_to :option, optional: true # Para las preguntas de opción múltiple, en caso de que existan

  validates :answer, presence: true
end
