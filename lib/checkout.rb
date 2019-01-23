class Checkout
  def initialize(pricing_rules)
    raise ArgumentError if !pricing_rules.kind_of?(Array) || pricing_rules.empty?

    @pricing_rules = pricing_rules
    @cart = {}
  end

  def scan(item)
    if valid_item?(item)
      @cart[item.code] = 0 if @cart[item.code].nil?

      @cart[item.code]+=1
    end
  end

  private

  def valid_item?(item)
    !!@pricing_rules.detect {|pr| pr.item == item}
  end
end
