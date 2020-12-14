require 'rails_helper'

RSpec.describe Api::V1::FavouritesController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      @user = FactoryBot.create :user
      @home_list = FactoryBot.create_list(:home, 8)
      @fav_list = FactoryBot.build_list(:favourite, 5, user_id: @user.id) do |i, idx|
        i.id = idx
        i.home_id = @home_list[idx].id
      end
      p @fav_list
      get :index, params: { favourites: @fav_list, format: :json }
    end

    it 'should list the favourites homes' do
    end

    it { should respond_with 200 }
  end
end
