class ItemsController < ApplicationController


  def index
    @items = Item.page(params[:page]).per(12)
    @parents = Category.all.where(ancestry: nil)

    @q = Item.ransack(params[:q])
    @itemlist = @q.result(distinct: true)
  end
  
  def show
  end

  def new
  end

  def confirm
  end

  private
  def testset
  end

end
