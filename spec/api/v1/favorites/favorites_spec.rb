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
  end
end