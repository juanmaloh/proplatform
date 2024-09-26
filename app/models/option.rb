class Option < ApplicationRecord
  belongs_to :question
  has_many :responses, dependent: :destroy # Relación con las respuestas de usuarios.
end
