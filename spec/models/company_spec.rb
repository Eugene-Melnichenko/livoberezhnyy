require 'rails_helper'

RSpec.describe Company, type: :model do
  before { @company = create(:company) }
  subject { @company }

  it { should be_valid}
  it { should respond_to(:email) }
  it { should respond_to(:phone) }

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
  end

end
