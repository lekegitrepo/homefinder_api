require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe 'POST #create' do
    before(:each) do
      @user = FactoryBot.create :user
    end

    context 'When user provide right credentials to sign in' do
      before(:each) do
        credentials = { email: @user.email, password: '123456789' }
        post :create, params: { user: credentials }
      end

      it 'returns the user record corresponding to the given credentials' do
        @user.reload
        user_obj = json_response[:user]
        expect(user_obj[:auth_token]).to eql @user.auth_token
      end

      it { should respond_with 200 }
    end

    context 'When user provide incorrect credentials to sign in' do
      before(:each) do
        credentials = { email: @user.email, password: 'wrong_password' }
        post :create, params: { user: credentials }
      end

      it 'response with is_success equal to false' do
        expect(json_response[:is_success]).to eql false
      end

      it { should respond_with 422 }
    end
  end
end
