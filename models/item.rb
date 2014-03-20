class Item
  attr_accessor :name, :price, :description

  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end

  def self.name
    @name
  end

end