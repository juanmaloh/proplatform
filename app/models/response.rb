class Response < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :option, optional: true # Si la pregunta no es de opción múltiple, este campo puede ser nulo.
end
