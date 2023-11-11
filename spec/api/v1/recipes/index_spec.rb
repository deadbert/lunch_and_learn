require 'rails_helper'

RSpec.describe "Recipe search by country endpoint" do
  describe "When I GET to recipe search endpoint", :vcr do
    it "returns JSON containing recipes with title, url, image, country-searched" do

      get "/api/v1/recipes?country=thailand"
    
      expect(response).to be_successful 
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to have_key :data
      recipes = data[:data]

      expect(recipes.first).to have_key :id
      expect(recipes.first[:id]).to eq(nil)

      expect(recipes.first).to have_key :attributes
      expect(recipes.first[:attributes]).to have_key :title
      expect(recipes.first[:attributes]).to have_key :url
      expect(recipes.first[:attributes]).to have_key :country
      expect(recipes.first[:attributes]).to have_key :image
    end

    it "Does not return keys outside of the defined schema", :vcr do

      get "/api/v1/recipes?country=thailand"
    
      expect(response).to be_successful 
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:data].first[:attributes]).to_not have_key :images
      expect(data[:data].first[:attributes]).to_not have_key :source
      expect(data[:data].first[:attributes]).to_not have_key :ingredients
      expect(data[:data].first[:attributes]).to_not have_key :calories
      expect(data[:data].first[:attributes]).to_not have_key :mealType
      expect(data[:data].first[:attributes]).to_not have_key :_links
    end

    it "returns a random country recipe search when country=random" do
      WebMock.allow_net_connect!
      VCR.eject_cassette
      VCR.turn_off!

      get "/api/v1/recipes?country=random"

      expect(response).to be_successful 
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to have_key :data
      recipes = data[:data]

      expect(recipes.first).to have_key :id
      expect(recipes.first[:id]).to eq(nil)

      expect(recipes.first).to have_key :attributes
      expect(recipes.first[:attributes]).to have_key :title
      expect(recipes.first[:attributes]).to have_key :url
      expect(recipes.first[:attributes]).to have_key :country
      expect(recipes.first[:attributes]).to have_key :image

      VCR.turn_on!
    end
  end
end