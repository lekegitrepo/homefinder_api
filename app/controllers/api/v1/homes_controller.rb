class Api::V1::HomesController < ApplicationController

  def index
    houses = Home.all
    if houses
      render json: { homes: houses }, status: :ok
    else
      render json: { errors: houses.errors }, status: :bad_request
    end
  end

  def show
    house = Home.find_by(id: params[:id])
    if house
      home_json 'House Detail', true, house, :ok
    else
      home_json 'Unable to find house information', true, { home: house.errors }, :not_found
    end
  end
end
