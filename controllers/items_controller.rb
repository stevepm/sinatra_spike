require './models/item'
class ItemsController

  def list_items
    [Item.new('Channa', '5.95', 'tastes good')]
  end
end

