class Api::V1::FavouritesController < ApplicationController
  before_action :authenticate_with_token, only: %i[create index destroy]
  def index
    user = User.find_by(id: params[:id])
    render json: user.homes.all
  end

  def create
    home = Home.find_by(id: params[:id])
    if home
      home.picked = true
      fav_home = Favourite.create(user_id: current_user.id, home_id: home.id)
      fav_json 'Set home as your favourite', true, fav_home, :created
    else
      fav_json 'Error!', false, { errors: home.errors }, :unprocessable_entity
    end
  end

  def destroy
    fav = Favourite.find_by(id: params[:id])
    # current_user.favourites.delete(fav)
    p "THIS IS FAVORITE OBJECT: #{fav}"
    home = Home.find_by(id: fav.home_id)
    p "THIS IS HOME OBJECT: #{home}"
    home.picked = false
    # fav.destroy
    fav_json 'Successfully remove home from favourite', true, {}, :no_content
    # if fav
    #   home = Home.find_by(id: fav.home_id)
    #   home.picked = false
    #   fav.destroy
    #   fav_json 'Successfully remove home from favourite', true, {}, :no_content
    # else
    #   fav_json 'Error!', false, { errors: fav.errors }, :unprocessable_entity
    # end
  end
end
