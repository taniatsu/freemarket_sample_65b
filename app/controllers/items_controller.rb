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
    binding.pry
    Item.create(item_params)
    # redirect_to root_path
    # @item = Item.new(item_params)
    # @item.save
    #   redirect_to controller: :items, action: :index
    # else
    #   render "new"
    # end
  end

  def confirm
  end

private
  def item_params
    params.require(:item).permit(:name)
  end

  def testset
  end


end
