require 'rails_helper'

RSpec.describe "Tourist sites endpoint" do
  describe "When a get request hits the tourist_sites endpoint" do
    it "returns a collection of tourist sites within 100 meter radius of capital city", :vcr do

      get '/api/v1/tourist_sites?country=France'

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key :data 
      expect(result[:data].first).to have_key :id
      expect(result[:data].first).to have_key :type
      expect(result[:data].first[:type]).to eq("tourist_site")
      expect(result[:data].first).to have_key :attributes
      expect(result[:data].first[:attributes]).to have_key :name
      expect(result[:data].first[:attributes]).to have_key :address
      expect(result[:data].first[:attributes]).to have_key :place_id
    end
  end
end