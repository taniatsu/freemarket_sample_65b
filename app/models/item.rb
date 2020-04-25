class Item < ApplicationRecord
  has_many :images
  has_many :comments
  has_many :likes
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  belongs_to :buyer
  belongs_to :seller
  belongs_to :purchase
end
