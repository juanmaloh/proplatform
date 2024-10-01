class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :forms, dependent: :destroy # Formularios creados por el usuario
  has_many :submissions, dependent: :destroy # Formularios que el usuario ha completado
end
