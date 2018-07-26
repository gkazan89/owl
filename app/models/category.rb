class Category < ApplicationRecord
  has_many :articles
  has_many :preferences
  has_many :users, through: :preferences
end
