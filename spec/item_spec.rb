require 'item'

RSpec.describe Item, "Item behaviour" do
  context "create an item" do
    it "without any arguments" do
      expect {Item.new}.to raise_error
    end

    it "with arguments must create one" do
      expect {Item.new('GR1', 'Green tea', 3.11)}.to_not raise_error
    end
  end
end
