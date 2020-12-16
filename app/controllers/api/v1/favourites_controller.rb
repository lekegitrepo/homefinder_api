class Api::V1::FavouritesController < ApplicationController
  def index
    user = User.find_by(id: params[:id])
    render json: user.homes.all
  end
end
