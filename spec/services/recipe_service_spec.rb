require 'rails_helper'

RSpec.describe RecipesService do
  describe "instance methods" do
    describe "#recipe_search" do
      it "returns a parsed JSON response from Recipe API", :vcr do

        data = RecipesService.new.recipe_search("thailand")

        expect(data).to have_key :hits
        recipes = data[:hits]

        expect(recipes).to be_an Array
        expect(recipes.first[:recipe]).to have_key :label
        expect(recipes.first[:recipe]).to have_key :image
        expect(recipes.first[:recipe]).to have_key :url
      end
    end
  end
end