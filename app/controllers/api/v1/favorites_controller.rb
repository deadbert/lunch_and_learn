class Api::V1::FavoritesController < ApplicationController

  def create
    parameters = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(api_key: parameters[:api_key])
    if user
      Favorite.create(country: parameters[:country], recipe_link: parameters[:recipe_link], recipe_title: parameters[:recipe_title], user_id: user.id)
      render json: {success: "Favorite added successfully"}
    else
      render json: ErrorSerializer.new(Error.new("No user found for api_key")), status: 404
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    favorites = Favorite.where('user_id = ?', user.id)
    require 'pry';binding.pry
  end
end