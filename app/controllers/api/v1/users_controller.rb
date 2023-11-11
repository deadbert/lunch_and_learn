class Api::V1::UsersController < ApplicationController

  def create
    user_info = JSON.parse(request.body.read, symbolize_names: true)
    user = User.new(name: user_info[:name], email: user_info[:email], password: user_info[:password], api_key: '1234')
    if user.save
      render json: UserSerializer.new(user)
    else
      render json: ErrorSerializer.new(Error.new(user.errors.full_messages))
    end
  end
end