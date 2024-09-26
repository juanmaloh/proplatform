class Question < ApplicationRecord
  belongs_to :form
  belongs_to :category
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy
end
