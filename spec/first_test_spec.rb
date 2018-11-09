RSpec.describe "first test spec" do
  describe "first test spec" do
    let(:text) {"hello world"}
    it "should be text 'hello world'" do
      expect(text).to eq("hello world")
    end
  end
end