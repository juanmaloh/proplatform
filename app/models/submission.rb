class Submission < ApplicationRecord
  belongs_to :form
  belongs_to :user # Usuario que está llenando el formulario
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :responses

  validates :form_id, presence: true
  validates :user_id, presence: true
end
