class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    else
      @order_delivery = OrderDelivery.new
    end
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    @item = Item.find(params[:item_id])
    if current_user != @item.user
      if @order_delivery.valid?
        @order_delivery.save
        redirect_to root_path
      else
        render :index
      end
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
