class User < ActiveRecord::Base
  has_secure_password

  has_many :favorite_recipes, dependent: :destroy
  has_many :recipes, through: :favorite_recipes
end
