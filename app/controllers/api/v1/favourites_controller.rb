class Api::V1::FavouritesController < ApplicationController
  before_action :authenticate_with_token, only: %i[create index destroy]
  def index
    fav_homes = current_user.homes.all
    if fav_homes
      fav_json 'List of your Favourite Houses', true, fav_homes, :ok
    else
      fav_json 'Unable to fetch List of Favourite Houses', false, { homes: fav_homes.errors }, :not_found
    end
  end

  def create
    home = Home.find_by(id: params[:id])
    if home
      home.picked = true
      home.save
      Favourite.create(user_id: current_user.id, home_id: home.id)
      fav_json 'Set home as your favourite', true, home, :created
    else
      fav_json 'Error!', false, { errors: home.errors }, :unprocessable_entity
    end
  end

  def destroy
    fav = current_user.favourites.find_by(home_id: params[:id])
    if fav
      home = Home.find_by(id: fav.home_id)
      home.picked = false
      home.save
      fav.destroy
      fav_json 'Successfully remove home from favourite', true, {}, :no_content
    else
      fav_json 'Error!', false, { errors: fav.errors }, :unprocessable_entity
    end
  end
end
