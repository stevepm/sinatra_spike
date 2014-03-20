require 'csv'

class ItemList

  def initialize
    @file = CSV.open(File.expand_path('../../models/itemsdb.csv',__FILE__), headers: true)
    @items_array = []
  end

  def list_items
    @file.each do |row|
      @items_array << Item.new(row['name'], row['price'], row['description'])
    end
    @items_array
  end

end