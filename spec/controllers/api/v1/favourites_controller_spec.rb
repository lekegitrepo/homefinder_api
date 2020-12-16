require 'rails_helper'

RSpec.describe Api::V1::FavouritesController, type: :controller do
  describe 'GET #index' do
    # before(:each) do
    #   @user = FactoryBot.create :user
    #   @home_list = FactoryBot.create_list(:home, 8)
    #   # @fav_list = FactoryBot.build_list(:favourite, 5)
    #   @fav_list = FactoryBot.build_list(:favourite, 5, user_id: @user.id) do |i, idx|
    #     i.id = idx
    #     i.home_id = @home_list[idx].id
    #   end
    #   # p "@fav_list: #{@fav_list.length}"
    #   get :index, params: { id: @user.id, format: :json }
    # end

    before(:each) do
      @user = FactoryBot.create :user
      @home = FactoryBot.create :home
      3.times { FactoryBot.create :favourite, user: @user, home: @home }
      get :index, params: { id: @user.id, format: :json }
    end

    it 'should list the favourites homes' do
      expect(json_response.length).to eql 3
    end

    it 'should contain detail of a home if one item is picked from the list' do
      expect(json_response[0]).to have_key(:description)
    end

    it { should respond_with 200 }
  end

  describe 'POST #create' do
    before(:each) do
      @fav = FactoryBot.create :favourite
      post :create, params: { favourite: @fav, format: :json }
    end

    it 'should return a json the contains user_id key' do
    end
  end
end
