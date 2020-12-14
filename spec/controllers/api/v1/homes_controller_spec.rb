require 'rails_helper'

RSpec.describe Api::V1::HomesController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @home = FactoryBot.create :home
      post :show, params: { id: @home.id, format: :json }
    end

    it 'should return information about the house' do
      expect(json_response[:home]).to have_key(:type)
    end
  end
end
