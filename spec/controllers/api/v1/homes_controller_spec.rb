require 'rails_helper'

RSpec.describe Api::V1::HomesController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @home = FactoryBot.create :home
      get :show, params: { id: @home.id, format: :json }
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

  describe 'GET #index' do
    before(:each) do
      @house_list = FactoryBot.create_list(:home, 10)
      get :index, params: { homes: @house_list, format: :json }
    end

    it 'should list the houses' do
      expect(@house_list.length).to eql(10)
    end

    it 'should list the houses with :homes as the key' do
      expect(json_response).to have_key(:homes)
    end

    context 'When first item is picked from the list' do
      it 'should return the detail of the first house picked' do
        first_home = json_response[:homes].first
        expect(first_home).to have_key(:home_type)
      end
    end
  end
end
