require 'rails_helper'

RSpec.describe Service, type: :model do
  before { @service = create(:service) }
  subject { @service }

  it { should be_valid}
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }

  describe "Associations" do
    it { should have_many(:orders) }
    it { should have_many(:users).through(:orders) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end
end
