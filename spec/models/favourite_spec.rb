require 'rails_helper'

RSpec.describe Favourite, type: :model do
  before(:each) { @fav = FactoryBot.build(:favourite) }

  it { should respond_to(:user_id) }
  it { should respond_to(:home_id) }

  it { should_not be_valid }
end
