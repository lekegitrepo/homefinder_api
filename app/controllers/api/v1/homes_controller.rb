class Api::V1::HomesController < ApplicationController

  def show
    house = Home.find_by(id: params[:id])
    if house
      home_json 'House Detail', true, house, :ok
    else
      home_json 'Unable to find house information', true, { home: house.errors }, :not_found
    end
  end
end
