require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end
  describe "api_key" do
    it "generates it's own api_key on initiallization" do
      user = User.create(name: "bob", email: "bobo@1234.com", password: "1234")

      expect(user.api_key).to be
      expect(user.errors[:api_key]).to_not include("can't be blank")
    end
  end
end