class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm, :destroy,:edit,:update]
  before_action :set_category, only: [:index, :show, :destroy, :edit, :update]

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

  def update
    if @item.update(item_params)
      redirect_to items_path,notice: '変更を保存しました'
    else
      render :edit, notice: '変更できませんでした'
    end
  end

  def destroy
    unless current_user.id == @item.user_id && @item.destroy
      render :show, notice: '削除できませんでした'
    end
  end

  private
  def item_params
    params.require(:item).permit(:category_id, :name, :brand, :explanation, :condition, :price, :size, :fee_which, :from_where, :delivery_date, :thumbnail).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @parents = Category.all.where(ancestry: nil)
  end

end
