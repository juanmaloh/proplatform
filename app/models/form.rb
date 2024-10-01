class Form < ApplicationRecord
  has_and_belongs_to_many :categories # Relación de muchos a muchos con categorías
  has_and_belongs_to_many :questions, join_table: :forms_questions
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  has_many :submissions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
end
