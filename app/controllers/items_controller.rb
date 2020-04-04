class ItemsController < ApplicationController


  def index
    @items = Item.page(params[:page]).per(12)
    @parents = Category.all.where(ancestry: nil)
  end
  
  def show
  end

  def new
    @item = Item.new
  end

  def confirm
  end

  private
  def testset
  end

end
