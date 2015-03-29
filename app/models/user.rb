class User < ActiveRecord::Base
  has_secure_password

  has_many :favorite_recipes, dependent: :destroy
  has_many :recipes, through: :favorite_recipes

  validates :username, uniqueness: true, length: { in: 3..20 }
  validate :password_validation

  def password_validation
    if not password.nil?
      unless password.match(/[A-Z]/) && password.match(/[[:digit:]]/) && password.length > 7
        errors.add(:password, "The password needs to contain at least one digit and one capital letter, and the minimum password length is eight characters.")
      end
    end
  end
end
