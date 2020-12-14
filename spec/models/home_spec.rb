require 'rails_helper'

RSpec.describe Home, type: :model do
  before { @home = FactoryBot.build(:home) }

  subject { @home }

  it { should respond_to(:home_type) }
  it { should respond_to(:description) }
  it { should respond_to(:location) }

  it { should be_valid }
end
