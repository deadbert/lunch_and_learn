class Api::V1::SessionsController < ApplicationController

  def create
    credentials = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(email: credentials[:email])
    if user.authenticate(credentials[:password])
      render json: UserSerializer.new(user)
    else
      render json: ErrorSerializer.new(Error.new("User name or password incorrect")), status: 400
    end
  end
end