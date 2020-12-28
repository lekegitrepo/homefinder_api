class Api::V1::FavouritesController < ApplicationController
  before_action :authenticate_with_token, only: %i[create index destroy]
  def index
    user = User.find_by(id: params[:id])
    render json: user.homes.all
  end

  def create
    home = Home.find_by(id: params[:id])
    fav_home = Favourite.create(user_id: current_user.id, home_id: home.id)
    fav_json 'Set home as your favourite', true, fav_home, :created
  end

  def destroy
    fav = Favourite.find_by(id: params[:id])
    if fav
      fav.destroy
      fav_json 'Successfully remove home from favourite', true, {}, :no_content
    else
      fav_json 'Error!', false, { errors: fav.errors }, :unprocessable_entity
    end
  end
end
