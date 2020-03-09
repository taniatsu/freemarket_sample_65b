# README

## ↓↓↓DB設計↓↓↓

## ↓↓↓ユーザー関連↓↓↓
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_jp_name|string|null: false|
|last_jp_name|string|null: false|
|year|integer|null: false|
|month|date|null: false|
|day|date|null: false|
|email|string|null: false, unique: true|
|tel|integer||
|nickname|string|null: false|
|password|string|null: false|

### Association
- has_many :items
- has_many :likes
- has_many :comments
- has_many :delivery_addresses
- has_many :bought_items
- has_many :selling_items
- has_many :sold_items
- has_one :self_address
- has_one :card


## self_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|zipcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||

### Association
- belongs_to :user


## delivery_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_jp_name|string|null: false|
|last_jp_name|string|null: false|
|zipcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||

### Association
- belongs_to :user
## ↑↑↑ユーザー関連↑↑↑

## ↓↓↓商品関連↓↓↓
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|name|string|null: false|
|explanation|text|null: false|
|condition|string||
|price|integer|null: false|
|size|string|null: false|
|fee_which|string|null: false|
|from_where|string|null: false|
|delivery_date|string|null: false|
|status|string|null: false|
|buyer_id|integer|null: false, class_name: "User", foreign_key: "buyer_id"|
|seller_id|integer|null: false, class_name: "User", foreign_key: "seller_id"|

### Association
- has_many :images
- has_many :comments
- has_many :likes
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- belongs_to :buyer
- belongs_to :seller


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|url|string|null: false|

### Association
- belongs_to :item


## categoryiesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items
- has_ancestry


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :items
## ↑↑↑商品関連↑↑↑


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user
## ↑↑↑DB設計↑↑↑