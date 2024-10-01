class Question < ApplicationRecord
  has_and_belongs_to_many :forms, join_table: :forms_questions # Relación de muchos a muchos con formularios
  belongs_to :category # La categoría a la que pertenece la pregunta
  has_many :options, dependent: :destroy # Opciones para preguntas de opción múltiple
  has_many :responses, dependent: :destroy # Las respuestas que se han dado a esta pregunta

  validates :content, presence: true
  accepts_nested_attributes_for :options, allow_destroy: true
end
