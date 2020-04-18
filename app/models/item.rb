class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments
  has_many :likes
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  belongs_to :buyer
  belongs_to :seller
end
