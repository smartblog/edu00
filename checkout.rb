PRICES = {
  "CC"=>['Coca-Cola', 1.50],
  "PC"=>['Pepsi-Cola', 2.0],
  "WA"=>['Water', 0.85]
}

class Item
  attr_reader :title, :price, :code
  attr_writer :price

  def initialize(code)
    @code = code
    @title = PRICES[code][0]
    @price = PRICES[code][1]
  end
end

class Checkout
  attr_reader :items

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = []
  end

  def add(item)
    @items << Item.new(item)
  end


  def total
    summ = 0.0
    @pricing_rules.discount(self, 'PC')
    self.items.each { |item| summ = summ + item.price }
    summ
  end
end

class Discount1
  def discount(checkout, discount_item)
    #Discount %(percent) if items in checkout >= item_count
    percent = 20
    item_count = 3
    discount_items = checkout.items.find_all{ |item| item.code == discount_item }
    checkout.items.each { |item| item.price = item.price - (item.price / 100 * percent) if item.code == discount_item} if discount_items.count >= item_count
  end
end

co = Checkout.new(Discount1.new)
co.add('CC')
co.add('PC')
co.add('CC')
co.add('WA')
co.add('PC')
co.add('PC')

p co.items
p co.total
p co.items
