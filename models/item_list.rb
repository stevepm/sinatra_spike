require 'csv'

class ItemList

  def initialize
    @file = CSV.open(File.expand_path('../../models/itemsdb.csv',__FILE__), headers: true)
    @items_array = []
  end

  def list_items(search)
    @file.each do |row|
      if search.empty?
        @items_array << Item.new(row['name'], row['price'], row['description'])
      else
        if row['name'].downcase.include?(search.downcase)
          @items_array << Item.new(row['name'], row['price'], row['description'])
        end
      end
    end
    @items_array
  end


end