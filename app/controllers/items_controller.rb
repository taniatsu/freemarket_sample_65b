class ItemsController < ApplicationController

  before_action :testset, only:[:show]

  def index
    @items = Item.all.order(id: "DESC")
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
    @item = Item.find(params[:id])
  end

end
