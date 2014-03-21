require 'csv'

class ItemList
  attr_reader :file

  def initialize
    @file = File.expand_path('../../models/itemsdb.csv',__FILE__)
    @items_array = []
  end

  def list_items(search)
    CSV.foreach(@file, headers: true) do |row|
      if search.empty?
        @items_array << Item.new(row['name'])
      else
        if row['name'].downcase.include?(search.downcase)
          @items_array << Item.new(row['name'])
        end
      end
    end
    @items_array
  end

  def add_item(name)
    CSV.open(@file, 'a+') do |row|
      row << [name,]
    end
  end

end