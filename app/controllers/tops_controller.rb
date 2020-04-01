class TopsController < ApplicationController
  def index
    @items = Item.all.order(id: "DESC")
    @lastItem = @items.first(3)
    # @categories
  end
end
