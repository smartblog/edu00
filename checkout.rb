$price_list = {
  "CC"=>['Coca-Cola', 1.50],
  "PC"=>['Pepsi-Cola', 2.0],
  "WA"=>['Water', 0.85]
}

class Item
  attr_reader :title, :price, :code
  attr_writer :price

  def initialize(code)
    @code = code
    @title = $price_list[code][0]
    @price = $price_list[code][1]
  end
end

class Checkout
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def total
    summ = 0.0
    pc = self.items.find_all{ |item| item.code == 'PC' }
    self.items.each { |item| item.price = item.price * 0.8 if item.code == 'PC'} if pc.count >= 3

    self.items.each { |item| summ = summ + item.price }
    summ
  end
end

pricing_rules = {
  'CC'=>['Coca-Cola', 1.50],
  'PC'=>['Pepsi-Cola', 2.0],
  'WA'=>['Water', 0.85]
}

co = Checkout.new
item1 = Item.new('CC')
item2 = Item.new('PC')
item3 = Item.new('CC')
item4 = Item.new('WA')
item5 = Item.new('PC')
item6 = Item.new('PC')
co.add(item1)
co.add(item2)
co.add(item3)
co.add(item4)
co.add(item5)
co.add(item6)

p co.items
p co.pricing_rules
p co.total
p co.items
