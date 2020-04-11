class ItemsController < ApplicationController


  def index
    @items = Item.page(params[:page]).per(12)
    @parents = Category.all.where(ancestry: nil)
  end
  
  def show
    @parents = Category.all.where(ancestry: nil)
    @item = Item.find(params[:id])
  end

  def new
  end

  def confirm
    # item = Item.find(params[:item_id])
  end

  def edit
  end

  private
  def testset
  end

end
