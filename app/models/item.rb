class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
