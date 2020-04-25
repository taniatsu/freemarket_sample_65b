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
    # @parents = Category.all.order("ancestry ASC").limit(13)
    @parents = Category.all.where(ancestry: nil)
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

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
        #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
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
    params.require(:item).permit(:name, :explanation, :brand, :condition, :size, :fee_which, :status, :from_where, :delivery_date, :price, images_attributes: [:url])
  end

  def testset
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @parents = Category.all.where(ancestry: nil)
  end

end
