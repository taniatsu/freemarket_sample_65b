class ItemsController < ApplicationController
  before_action :set_item, only: [:index,:show, :confirm, :destroy,:edit,:update]
  before_action :set_category, only: [:index, :show, :destroy, :edit, :update]
  
  def index
    @items = Item.page(params[:page]).per(12)
  end
  
  def show
  end

  def new
    @item = Item.new
    @item.images.new
    @parents = Category.all.order("id ASC").limit(13)

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
      # データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
      # データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
      render :new
    end
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

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    unless current_user.id == @item.seller_id && @item.destroy
      render :show, notice: '削除できませんでした'
    end
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

  private
  def item_params
    params.require(:item).permit(
      :name,
      :explanation, 
      :brand, 
      :condition, 
      :size, 
      :fee_which, 
      :from_where, 
      :delivery_date, 
      :price, 
      :category_id, 
      images_attributes: [:url, :_destroy, :id], 
    ).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @parents = Category.all.where(ancestry: nil)
  end

end
