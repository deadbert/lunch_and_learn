class Api::V1::UsersController < ApplicationController

  def create
    user_info = JSON.parse(request.body.read, symbolize_names: true)
    user = User.new(name: user_info[:name], email: user_info[:email], password: user_info[:password])
    if user_info[:password] != user_info[:password_confirmation]
      render json: {error: "Passwords must match"}
    elsif user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: ErrorSerializer.new(Error.new(user.errors.full_messages))
    end
  end
end