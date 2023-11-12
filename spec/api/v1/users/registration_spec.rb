require 'rails_helper'

RSpec.describe "Register User endpoint" do
  describe "when a post request hits users endpoint" do
    it "creates a new user in the database and hashes their password" do
      user = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "treats4lyf"
      }

      post "/api/v1/users", params: user, as: :json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key :data
      expect(result[:data]).to have_key :type
      expect(result[:data][:type]).to eq("user")
      expect(result[:data]).to have_key :id
      expect(result[:data][:id]).to_not be nil
      expect(result[:data][:attributes]).to have_key :name
      expect(result[:data][:attributes]).to have_key :email
      expect(result[:data][:attributes]).to have_key :api_key

      new_user = User.find(result[:data][:id])
      expect(new_user.password_digest).to_not eq(user[:password])
      expect(new_user.authenticate("1234")).to be false
      expect(new_user.authenticate(user[:password])).to eq(new_user)
    end

    it "Won't create a new user if email address is already in use" do
      User.create(name:"bobby", email: "goodboy@ruffruff.com", password: "1234", password_confirmation: "1234")

      user = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "treats4lyf"
      }

      post "/api/v1/users", params: user, as: :json

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:type]).to eq("error")
      expect(result[:data][:attributes][:error_message]).to eq(["Email has already been taken"])
    end

    it "Returns error message if passwords do not match" do
      User.create(name:"bobby", email: "goodboy@ruffruff.com", password: "1234", password_confirmation: "1234")

      user = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "1234"
      }

      post "/api/v1/users", params: user, as: :json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:error]).to eq("Passwords must match")
    end
  end
end