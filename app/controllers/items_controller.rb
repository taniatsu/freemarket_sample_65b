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

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render "new"
    end
  end

  def confirm
  end

private
  def testset
  end

  def item_params
    params.require(:item).permit(:name)
  end


end
