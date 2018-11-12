require 'rails_helper'

RSpec.describe Comment, type: :model do

  before { @comment = create(:comment) }

  it { should validate_presence_of(:commenter) }
  it { should validate_length_of(:commenter).is_at_least(5) }

  it { should belong_to(:article) }

  describe "When comment is valid" do
    it "is valid with commenter" do
      expect(@comment).to be_valid
    end
  end

  describe "When comment invalid" do
    it "is not valid without a title" do
      @comment.commenter = nil
      expect(@comment).to_not be_valid
    end
  end

end
