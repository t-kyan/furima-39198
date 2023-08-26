class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :adress, :building, :phone_number, :user_id, :item_id
end