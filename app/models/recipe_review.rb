class RecipeReview < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :stars,    presence:   true
  validates :stars,    numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :title,    presence:   true
  validates :comments, presence:   true

  def self.sort_by_recipe_and_time(recipe_reviews)
    recipe_reviews.sort { |recipe_review_1,recipe_review_2|
      if recipe_review_1.recipe.name != recipe_review_2.recipe.name
        recipe_review_1.recipe.name <=> recipe_review_2.recipe.name
      else
        recipe_review_1.created_at <=> recipe_review_2.created_at
      end
    }
  end
end
