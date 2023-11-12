require 'rails_helper'

RSpec.describe "Sessions endpoint" do
  describe "When a post request hits the sessions endpoint" do
    it "verify's users email and password, then sends positive response back" do
      User.create(name:"Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")

      user_info = {email: "goodboy@ruffruff.com", password: "treats4lyf"}
      post "/api/v1/sessions", params: user_info, as: :json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key :data
      expect(result[:data]).to have_key :id
      expect(result[:data]).to have_key :type
      expect(result[:data][:type]).to eq("user")
      expect(result[:data]).to have_key :attributes
      expect(result[:data][:attributes]).to have_key :name
      expect(result[:data][:attributes]).to have_key :email
      expect(result[:data][:attributes]).to have_key :api_key
    end

    it "Returns an error if the user credentials can not be verified" do
      User.create(name:"Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")

      user_info = {email: "goodboy@ruffruff.com", password: "1234"}
      post "/api/v1/sessions", params: user_info, as: :json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:data][:type]).to eq("error")
      expect(result[:data][:attributes][:error_message]).to eq("User name or password incorrect")
    end
  end
end