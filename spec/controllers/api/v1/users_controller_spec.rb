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

    context 'When user provide invalid registration requirements' do
      before(:each) do
        @invalid_user = { password: '1234567', password_confirmation: '1234567' }
        post :create, params: { user: @invalid_user, format: :json }
      end

      it 'should return a json with errors' do
        expect(json_response[:is_success]).to eql false
      end

      it 'should contain json with errors key' do
        expect(json_response[:user]).to have_key(:errors)
      end

      it "should contain an email error message: can't be blank" do
        user_resp = json_response[:user]
        expect(user_resp[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe 'GET #show' do
    before(:each) do
      @user = FactoryBot.create :user
      get :show, params: { id: @user.id, format: :json }
    end

    it 'should return an information about a user' do
      user_resp = json_response[:user]
      expect(user_resp[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end
end
