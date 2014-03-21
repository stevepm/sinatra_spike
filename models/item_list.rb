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
    if !name.to_s.empty?
      CSV.open(@file, 'a+') do |row|
        row << [self.return_next_id,"#{name}",]
      end
    end
  end

  def return_next_id
    id = 0
    CSV.foreach(@file, headers: true) do |row|
      id = row['id'].to_i
    end
    id + 1
  end

  def show_item(id)
    CSV.foreach(@file, headers:true) do |row|
      if row['id'].to_i == id.to_i
        return row['name']
      end
    end
  end

  def find_id(name)
    CSV.foreach(@file, headers:true) do |row|
      if row['name'].to_s == name.to_s
        return row['id'].to_s
      end
    end
  end

end