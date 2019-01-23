require 'pricing_rule'
require 'item'

RSpec.describe PricingRule, "Pricing Rule behaviour" do
  context "create a pricing rule" do
    it "without arguments" do
      expect {PricingRule.new}.to raise_error
    end

    it "with arguments" do
      item = Item.new('GR1', 'Green tea', 3.11)
      expect {PricingRule.new(item)}.to_not raise_error
    end
  end
end
