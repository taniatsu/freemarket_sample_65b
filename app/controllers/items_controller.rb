class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm]
  before_action :set_category, only: [:index, :show, :destroy]

  def index
    @items = Item.page(params[:page]).per(12)
  end
  
  def show
  end

  def new
  end

  def confirm
  end

  def edit
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private
  def testset
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @parents = Category.all.where(ancestry: nil)
  end

end
