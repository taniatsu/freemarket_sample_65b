class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm, :destroy]
  before_action :set_category, only: [:index, :show, :destroy]

  def index
    @items = Item.page(params[:page]).per(12)
  end
  
  def show
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    Item.create(item_params)
    # @item = Item.new(item_parameter)
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

  def confirm
  end

  def edit
  end

  def destroy
    unless current_user.id == @item.user_id && @item.destroy
      render :show,　notice: '削除できませんでした'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :brand, :size, :price, seller_id: current_user.id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @parents = Category.all.where(ancestry: nil)
  end

end
