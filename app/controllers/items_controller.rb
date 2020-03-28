class ItemsController < ApplicationController

  before_action :testset, only:[:show]

  def index
    @items = Item.all
    # @itemttt = Item.new
    
    @image = @item.images

    @images = Image.all
    # @images = @item.images.find(1)
    # @imagesTest = @images.find(1)
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
    # @image= Image.find(params[:image_id])
  end

end
