require 'rails_helper'

RSpec.describe Api::V1::FavouritesController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      @home = FactoryBot.create :home
      @user = FactoryBot.create :user
      request.headers['Authenticate'] = @user.auth_token
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
      @home = FactoryBot.create :home
      @user = FactoryBot.create :user
      request.headers['Authenticate'] = @user.auth_token
      post :create, params: { id: @home.id, format: :json }
    end

    it 'should return a json the contains user_id key' do
      expect(json_response[:favourites]).to have_key(:user_id)
    end

    it { should respond_with 201 }
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @home = FactoryBot.create :home
      @user = FactoryBot.create :user
      request.headers['Authenticate'] = @user.auth_token
      @fav = FactoryBot.create :favourite, user: @user, home: @home
      delete :destroy, params: { id: @fav.id, format: :json }
    end

    it 'should return a json the contains user_id key' do
      expect(json_response).to have_key(:is_success)
    end

    it 'should return a json the contains is_success key' do
      expect(json_response[:is_success]).to eql true
    end

    it 'should return a json the contains is_success key set to true' do
      expect(json_response[:message]).to eql 'Successfully remove home from favourite'
    end

    it { should respond_with 204 }
  end
end
