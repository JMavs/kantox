require 'checkout'
require 'item'
require 'pricing_rule'

RSpec.describe Checkout, "Checkout behaviour" do
  context "create a checkout" do
    it "without arguments it must not create a new one" do
      expect {Checkout.new}.to raise_error(ArgumentError)
    end

    it "with an empty array it must not create a new one" do
      expect {Checkout.new([])}.to raise_error(ArgumentError)
    end

    it "with a non-empty array create a new one object" do
      item = Item.new('GR1', 'Green tea', 3.11)
      pricing_rules = [PricingRule.new(item)]
      expect {Checkout.new(pricing_rules)}.to_not raise_error
    end
  end
end
