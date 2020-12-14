require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST #create' do
    before(:each) do
      @user = FactoryBot.attributes_for :user
      post :create, params: { user: @user, format: :json }
    end

    it 'should return the user record in json format' do
      user_json = json_response[:user]
      expect(user_json[:email]).to eql @user[:email]
    end

    it { should respond_with 201 }
  end
end
