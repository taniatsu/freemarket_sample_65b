class ItemsController < ApplicationController
  before_action :set_item, only: [:index, :edit, :show, :confirm, :destroy]
  before_action :set_category, only: [:index, :show, :destroy]

  def index
    @items = Item.page(params[:page]).per(12)
  end
  
  def show
  end

  def new
    @item = Item.new
    @item.images.new
    # @item.images.new
    # @item.images.new
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
    # Item.create(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
    # respond_to do |format|
    #   if @item.save
    #       params[:images][:image].each do |image|
    #         @item.images.create(image: image, item_id: @item.id)
    #       end
    #     format.html{redirect_to root_path}
    #   else
    #     @item.images.build
    #     format.html{render action: 'new'}
    #   end
    # end
  end

  def confirm
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
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
    # params.require(:item).permit(:name)
    params.require(:item).permit(
      :name,
      :explanation, 
      :brand, 
      :condition, 
      :size, 
      :fee_which, 
      :status, 
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
