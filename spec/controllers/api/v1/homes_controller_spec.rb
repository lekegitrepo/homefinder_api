require 'rails_helper'

RSpec.describe Api::V1::HomesController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @home = FactoryBot.create :home
      post :show, params: { id: @home.id, format: :json }
    end

    it 'should return json that contain key :home_type' do
      expect(json_response[:home]).to have_key(:home_type)
    end

    it 'should return json that contain key :description' do
      expect(json_response[:home]).to have_key(:description)
    end

    it 'should return json that contain key :location' do
      expect(json_response[:home]).to have_key(:location)
    end

    it { should respond_with 200 }
  end
end
