require 'rails_helper'

RSpec.describe Comment, type: :model do
  before { @comment = create(:comment) }
  subject { @comment }

  it { should be_valid}
  it { should respond_to(:commenter) }
  
  describe "Associations" do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:commenter) }
    it { should validate_length_of(:commenter).is_at_least(5) }
  end

  describe "When comment invalid" do
    it "is not valid without a title" do
      @comment.commenter = nil
      expect(@comment).to_not be_valid
    end
  end

end
