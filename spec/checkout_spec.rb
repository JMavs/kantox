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

  context "add content to checkout" do
    it "must add an item" do
      item = Item.new('GR1', 'Green tea', 3.11)
      pricing_rules = [PricingRule.new(item)]
      co = Checkout.new(pricing_rules)

      expect {co.scan(item)}.to_not raise_error
    end

    it "must not add an item that have not a pricing rule (not registered as item in the shop)" do
      item = Item.new('GR1', 'Green tea', 3.11)
      pricing_rules = [PricingRule.new(item)]
      co = Checkout.new(pricing_rules)

      item_invented = Item.new("NO1", "Crunchy chocolate sticks", 5.00)

      expect {co.scan(item_invented)}.to raise_error(NoRegisteredItem)
    end
  end

  context "calculate total without offers" do
    it "checkout one item" do
      item = Item.new('GR1', 'Green tea', 3.11)
      pricing_rules = [PricingRule.new(item)]
      co = Checkout.new(pricing_rules)
      co.scan(item)

      expect(co.total).to eq(3.11)
    end

    it "checkout a few items (Test 1)" do
      pricing_rules = []

      tea = Item.new('GR1', 'Green tea', 3.11)
      coffee = Item.new('CF1', 'Coffee', 11.23)

      pricing_rules << PricingRule.new(tea)
      pricing_rules << PricingRule.new(coffee)

      co = Checkout.new(pricing_rules)
      co.scan(tea)
      co.scan(coffee)

      expect(co.total).to eq(14.34)
    end

    it "checkout a few items (Test 2)" do
      pricing_rules = []

      strawberries = Item.new('SR1', 'Strawberries', 5.00)
      coffee = Item.new('CF1', 'Coffee', 11.23)

      pricing_rules << PricingRule.new(strawberries)
      pricing_rules << PricingRule.new(coffee)

      co = Checkout.new(pricing_rules)
      co.scan(strawberries)
      co.scan(coffee)

      expect(co.total).to eq(16.23)
    end

  end
end
