class Form < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :fields, presence: true # Puedes ajustar esto según tus necesidades
end
