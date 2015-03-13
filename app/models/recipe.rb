class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :materials, through: :ingredients
end
