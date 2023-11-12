require 'rails_helper'

RSpec.describe "Favorites endpoint" do
  describe "Post to favorites endpoint" do
    it "favorites a recipe for a user in the DB" do
      user = User.create(name:"bobby", email: "hill@king.com", password: "1234", password_confirmation: "1234")

      data = {
        "api_key": "#{user.api_key}",
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: data, as: :json

      expect(response).to be_successful
      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:success]).to eq("Favorite added successfully")
    end

    it "returns an error if the given API key does not match a user" do
      user = User.create(name:"bobby", email: "hill@king.com", password: "1234", password_confirmation: "1234")

      data = {
        "api_key": "1234",
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: data, as: :json

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:attributes][:error_message]).to eq("No user found for api_key")
    end
  end

  describe "When a get request hit the favorites endpoint" do
    it "returns a list of the users favorited recipes" do
      bobby = User.create(name:"bobby", email: "hill@king.com", password: "1234", password_confirmation: "1234")

      Favorite.create(country: "place", recipe_link: "linky", recipe_title: "food stuff", user_id: bobby.id)

      get "/api/v1/favorites?api_key=#{bobby.api_key}"

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key :data
      expect(result[:data]).to be_an Array
      expect(result[:data].first).to have_key :id
      expect(result[:data].first).to have_key :type
      expect(result[:data].first[:type]).to eq("favorite")
      expect(result[:data].first).to have_key :attributes
      expect(result[:data].first[:attributes]).to have_key :recipe_title
      expect(result[:data].first[:attributes]).to have_key :recipe_link
      expect(result[:data].first[:attributes]).to have_key :country
      expect(result[:data].first[:attributes]).to have_key :created_at
    end

    it "returns an error if the api_key does not match a user" do
      hank = User.create(name:"Hank", email: "hilldad@king.com", password: "1234", password_confirmation: "1234")

      Favorite.create(country: "place", recipe_link: "linky", recipe_title: "food stuff", user_id: hank.id)

      get "/api/v1/favorites?api_key=aaaa"

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:error]).to eq("Invalid api_key provided")
    end
  end
end