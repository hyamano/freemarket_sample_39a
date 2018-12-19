class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
    @ladies = @items.where(lcategory_id: '1').limit(4)
    @mens = @items.where(lcategory_id: '2').limit(4)
    @baby = @items.where(lcategory_id: '3').limit(4)
    @cosme = @items.where(lcategory_id: '6').limit(4)
    @chanel = @items.where(brand: 'シャネル').limit(4)
    @vuitton = @items.where(brand: 'ルイ ヴィトン').limit(4)
    @supreme = @items.where(brand: 'シュプリーム').limit(4)
    @nike = @items.where(brand: 'ナイキ').limit(4)
  end

  def show
    @item  = Item.find(params[:id])

    @thumbnails = @item.images
    @same_saler_items = Item.where(saler_id: @item.saler_id).where.not(id: @item.id).first(6)
    @same_category_items = Item.where(lcategory_id: @item.lcategory_id).where.not(id: @item.id).first(6)
  end


  def purchased
    @item = Item.find(params[:id])
    Payjp.api_key = PAYJP_SECRET_KEY
    charge = Payjp::Charge.create(
    :amount => @item.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
    @item.update(buyer_id: current_user.id)
  end


  def new
    if user_signed_in?
      @item = Item.new
      @item.images.build
      @item.build_shipping_method
    else
      redirect_to new_user_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash[:alert] = '※必須項目を入力してください'
      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.saler_id == current_user.id
      item.update!(item_params)
    end
  end

  def seller
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.saler.id == current_user.id
      item.destroy
      redirect_to user_path(item.saler.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :detail, :condition, :size, :brand, :lcategory_id, :mcategory_id,:scategory_id, shipping_method_attributes: [:id, :burden_fee, :shipping_methods, :days_to_arrival, :prefecuture], images_attributes: [:id, :image]).merge(saler_id: current_user.id)
  end

end
