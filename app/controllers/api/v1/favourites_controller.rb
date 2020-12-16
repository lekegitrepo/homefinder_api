class Api::V1::FavouritesController < ApplicationController
  before_action :authenticate_with_token, only: [:create]
  def index
    user = User.find_by(id: params[:id])
    render json: user.homes.all
  end

  def create
    home = Home.find_by(id: params[:id])
    fav_home = Favourite.create(user_id: current_user.id, home_id: home.id)
    fav_json 'Set home as your favourite', true, fav_home, :created
  end
end
