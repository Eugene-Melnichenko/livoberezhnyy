require 'rails_helper'

RSpec.describe Article, type: :model do

  before { @article = create(:article) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }
  it { should validate_length_of(:title).is_at_least(5).is_at_most(100) }
  it { should validate_length_of(:text).is_at_least(5) }

  it { should have_many(:comments) }

  describe "When article is valid" do
    it "is valid with title and text" do
      expect(@article).to be_valid
    end
  end

  describe "When article invalid" do
    it "is not valid without a title" do
      @article.title = nil
      expect(@article).to_not be_valid
    end

    it "is not valid without a text" do
      @article.text = nil
      expect(@article).to_not be_valid
    end

    it "is not valid without a title and text" do
      @article.title = nil
      @article.text = nil
      expect(@article).to_not be_valid
    end
  end

end
