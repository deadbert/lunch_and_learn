class RecipesFacade

  def initialize()
    @service = RecipesService.new()
  end

  def recipe_search(q)
    recipes = @service.recipe_search(q)
    recipes[:hits].map do |recipe|
      Recipe.new(recipe[:recipe])
    end
  end
end