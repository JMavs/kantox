require_relative './errors/no_registered_item'

class Checkout
  def initialize(pricing_rules)
    raise ArgumentError if !pricing_rules.kind_of?(Array) || pricing_rules.empty?

    @pricing_rules = format_pricing_rules(pricing_rules)
    @cart = {}
  end

  def scan(item)
    if valid_item?(item)
      @cart[item.code] = 0 if @cart[item.code].nil?

      @cart[item.code]+=1
    else
      raise NoRegisteredItem
    end
  end

  def total
    count = 0.0
    @cart.each do |key, value|
      count+=@pricing_rules[key].apply(@cart[key])
    end
    count
  end

  private

  def valid_item?(item)
    !!@pricing_rules.keys.detect {|code| code == item.code}
  end

  def format_pricing_rules(pricing_rules)
    {}.tap do |prs|
      pricing_rules.each do |pr|
        prs[pr.item.code] = pr
      end
    end
  end
end
