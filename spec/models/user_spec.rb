require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = create(:user) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_length_of(:first_name).is_at_most(20) }
  it { should validate_length_of(:last_name).is_at_most(20) }

  describe "When user is valid" do
    it "is valid with commenter" do
      expect(@user).to be_valid
    end
  end

end
