require 'rails_helper'

RSpec.describe Order, type: :model do
  before { @order = create(:order) }
  subject { @order }

  it { should be_valid}
  it { should respond_to(:message) }

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:service) }
  end

end
