require 'rails_helper'

RSpec.describe Admin, type: :model do
  before { @admin = create(:admin) }
  subject { @admin }

  it { should be_valid}
  it { should respond_to(:email) }
  it { should respond_to(:password) }

  describe "Associations" do
    it { should have_many(:articles) }
  end

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
