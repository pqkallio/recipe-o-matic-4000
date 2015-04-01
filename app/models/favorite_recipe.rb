class FavoriteRecipe < ActiveRecord::Base
  validates :recipe, uniqueness: { scope: :user,
                   message: "This recipe is already in your favorite recipes list"}

  belongs_to :user
  belongs_to :recipe
end
