class RecipeInstructionPhase < ActiveRecord::Base
  belongs_to :recipe

  validates :phase, presence: true, numericality: { greater_than: 0 }
  validates :content, presence: true
end
