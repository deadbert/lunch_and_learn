class Api::V1::RecipesController < ApplicationController

  def index
    recipes = RecipesFacade.new.recipe_search(params[:country])
    recipes.each { |recipe| recipe.set_search_term(request.params[:country])}

    render json: RecipeSerializer.new(recipes)
  end
end