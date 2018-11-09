require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "When article invalid" do
    it "when title == nil" do
      article = Article.new(text: "Text")
      expect(article.valid?).to eq(false)
    end

    it "when text == nil" do
      article = Article.new(title: "Title")
      expect(article.valid?).to eq(false)
    end

    it "when title and text == nil" do
      article = Article.new
      expect(article.valid?).to eq(false)
    end
  end

  describe "When article is valid" do
    it "when title and text != nil" do
      article = Article.new(title: "Title", text: "Text")
      expect(article.valid?).to eq(true)
    end
  end

end
