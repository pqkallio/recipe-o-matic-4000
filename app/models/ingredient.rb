class Ingredient < ActiveRecord::Base
  validates :material, presence: true
  validates :unit, presence: true
  validates :recipe, presence: true

  belongs_to :recipe
  belongs_to :material
  belongs_to :unit
end
