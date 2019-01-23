class PricingRule
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def apply(n)
    n*@item.price
  end
end
