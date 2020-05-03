class TopsController < ApplicationController
  def index
    @items = Item.all.order(id: "DESC")
    @lastItem = @items.first(6)
    @parents = Category.all.where(ancestry: nil)
  end
end
