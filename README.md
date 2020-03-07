# README

## ↓↓↓DB設計↓↓↓

## ↓↓↓ユーザー関連↓↓↓
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|firstName|string|null: false|
|lastName|string|null: false|
|firstJpName|string|null: false|
|lastJpName|string|null: false|
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
- has_many :delivery-addresses
- has_one :self-address


## self-addressesテーブル
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


## delivery-addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|firstName|string|null: false|
|lastName|string|null: false|
|firstJpName|string|null: false|
|lastJpName|string|null: false|
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
|use|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|itemName|string|null: false|
|exp|text|null: false|
|condition|string||
|brand|string||
|price|integer|null: false|
|sizedate|string|null: false|
|feeWhich|string|null: false|
|fromWhere|string|null: false|
|getDate|integer|null: false|
|status|string|null: false|

### Association
- has_many :images
- has_many :comments
- has_many :categoryLs
- has_many :likes
- belongs_to :user
- belongs_to :brand


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoryLsテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|catName|string|null: false|

### Association
- has_many :categoryMs
- belongs_to :item


## categoryMsテーブル
|Column|Type|Options|
|------|----|-------|
|categoryL|references|null: false, foreign_key: true|
|catName|string|null: false|

### Association
- has_many :categorySs
- belongs_to :categoryL


## categorySsテーブル
|Column|Type|Options|
|------|----|-------|
|categoryM|references|null: false, foreign_key: true|
|catName|string|null: false|

### Association
- belongs_to :categoryM


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|brandName|string||

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
## ↑↑↑DB設計↑↑↑