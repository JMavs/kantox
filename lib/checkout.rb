class Checkout
  def initialize(pricing_rules)
    raise ArgumentError if !pricing_rules.kind_of?(Array) || pricing_rules.empty?

    @pricing_rules = pricing_rules
    @cart = {}
  end
end
