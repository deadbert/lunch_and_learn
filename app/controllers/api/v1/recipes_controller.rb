class Api::V1::RecipesController < ApplicationController

  def index
    if params[:country] == "random"
      country = CountriesFacade.new.random_country
      recipes = RecipesFacade.new.recipe_search(country)
      recipes.each { |recipe| recipe.set_search_term(country)}
    else
      recipes = RecipesFacade.new.recipe_search(params[:country])
      recipes.each { |recipe| recipe.set_search_term(request.params[:country])}
    end
    render json: RecipeSerializer.new(recipes)
  end
end