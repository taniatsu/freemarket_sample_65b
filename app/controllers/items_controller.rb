class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm, :destroy,:edit]
  before_action :set_category, only: [:index, :show, :destroy, :edit]

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
    @grandchild_category = Category.find(@item.category_id)
    
    
  end

  def destroy
    unless current_user.id == @item.user_id && @item.destroy
      render :show,　notice: '削除できませんでした'
    end
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
