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

  def initialize
    @items = []
  end

  def add(item)
    @items << Item.new(item)
  end

  def total
    summ = 0.0
    pc = self.items.find_all{ |item| item.code == 'PC' }
    self.items.each { |item| item.price = item.price * 0.8 if item.code == 'PC'} if pc.count >= 3

    self.items.each { |item| summ = summ + item.price }
    summ
  end
end

co = Checkout.new
co.add('CC')
co.add('PC')
co.add('CC')
co.add('WA')
co.add('PC')
co.add('PC')

p co.items
p co.total
p co.items
