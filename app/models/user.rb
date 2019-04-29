class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, presence: true
         
  validates :name, presence: true, on: :update
  validates :name_kana, presence: true, on: :update
  validates :tel, presence: true, on: :update
  validates :birthday, presence: true, on: :update
  # validates :introducer, presence: true, on: :update
  validates :gender, presence: true, on: :update
  
end
