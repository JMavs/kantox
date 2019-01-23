require 'pricing_rule'

class DiscountWithMinQuantity < PricingRule
  def initialize(item, min_quantity, price, percentage)
    super(item)
    @min = min_quantity
    @price = price
    @percentage = percentage
  end

  def apply(n)
    if @min > n
      @item.price*n
    elsif @percentage
      (@item.price*n*@price).round(2)
    else
      @price*n
    end
  end
end
