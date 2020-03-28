class ItemsController < ApplicationController

  before_action :testset, only:[:show]

  def index
    @items = Item.all 
    # if @items.status = 0

  end
  
  def show
  end

  def new
  end

  def confirm
  end

  private
  def testset
    @item = Item.find(params[:id])
  end

end
