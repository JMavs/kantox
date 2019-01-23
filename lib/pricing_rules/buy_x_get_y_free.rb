require 'pricing_rule'

class BuyXGetYFree < PricingRule
  def initialize(item, each_get, each_free)
    super(item)
    @x = each_get
    @y = each_free
  end

  def apply(n)
    x = n / @x
    y = n % @x
    units_to_pay = x + y
    units_to_pay * @item.price
  end
end
