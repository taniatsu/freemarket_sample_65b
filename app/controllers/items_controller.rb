class ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(12)
    @parents = Category.all.where(ancestry: nil)
  end
  
  def show
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    # Item.create(item_params)
    @item = Item.new(item_parameter)
    respond_to do |format|
      if @item.save
          params[:images][:image].each do |image|
            @item.images.create(image: image, item_id: @item.id)
          end
        format.html{redirect_to root_path}
      else
        @item.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
  end

private
  def item_params
    params.require(:item).permit(:name, images_attributes: [:url])
  end

  def testset
  end


end
