class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :photo_path, :description, :total_time
  has_one :author
  has_many :user_recipe_favorites
end
