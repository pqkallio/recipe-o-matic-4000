class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :material
  belongs_to :unit
end
