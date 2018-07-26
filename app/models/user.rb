class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  has_many :preferences
  has_many :categories, through: :preferences
  has_many :histories
  has_many :articles, through: :histories
end
