require 'rails_helper'

RSpec.describe "Learning Resources endpoint" do
  describe "When a GET request goes to learning resources endpoint" do
    it "returns JSON with id null, type learning_resource, attributes: country, video:{}, images:[]", :vcr do

      get "/api/v1/learning_resources?country=laos"

      results = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(results).to have_key :data
      expect(results[:data]).to have_key :id
      expect(results[:data][:id]).to be nil
      expect(results[:data]).to have_key :attributes
      expect(results[:data][:attributes]).to have_key :country
      expect(results[:data][:attributes]).to have_key :video
      expect(results[:data][:attributes][:video]).to be_a Hash   
      expect(results[:data][:attributes]).to have_key :images
      expect(results[:data][:attributes][:images]).to be_an Array   
    end

    it "returns empty video hash and empty images array if no results are found", :vcr do

      get "/api/v1/learning_resources?country=zzzzzzzzzzzz"

      expect(response).to be_successful
      
      results = JSON.parse(response.body, symbolize_names: true)

      expect(results[:data][:attributes][:video]).to be_empty
      expect(results[:data][:attributes][:images]).to be_empty
    end
  end
end