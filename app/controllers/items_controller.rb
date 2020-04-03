class ItemsController < ApplicationController

  # before_action :testset, only:[:show]

  def index
    @items = Item.all.order(id: "DESC")
    @items = Item.page(params[:page]).per(12)
    @parents = Category.all.where(ancestry: nil)
  end
  
  def show
  end

  def new
  end

  def confirm
  end

  private
  def testset
    # @item = Item.find(params[:id])
  end

end
