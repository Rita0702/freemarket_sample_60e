test
# freemarket_sample_60e DB設計
## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unipue: true|
|email|string|null: false,unipue: true|
|password|string|null: false|
### Association
- has_many :products
- has_many :tradings
- has_many :comments
- has_many :likes
- has_many :sns_credentials
- has_one :creditcard
- has_one :profile
- has_one :address

## profile
|Column|Type|Options|
|------|----|-------|
|user_id|inteder|null: false,foreign_key|
|first_name|string|null: false,foreign_key|
|last_name|string|null: false,foreign_key|
|first_kana|string|null: false,foreign_key|
|last_kana|string|null: false,foreign_key|
|birth_year|date|null: false,foreign_key|
|birth_month|date|null: false,foreign_key|
|birth_day|date|null: false,foreign_key|
|phone_number|string|null: false,foreign_key,unipue: true|
### Association
- has_one: user

## address
|Column|Type|Options|
|------|----|-------|
|user-id|inteder||
|zipcode|string|null: false,foreign_key|
|prefecture|string|null: false,foreign_key|
|city|string|null: false,foreign_key|
|district|string|null: false,foreign_key|
|building|string|foreign_key|
### Association
- has_one :user

## products
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
|price|string|null: false|
|seller_name_id|inteder|null: false,foreign_key: true|
|category_id|inteder|null: false,foreign_key: true|
|brand|string|null: false|
|size_id|inteder|foreign_key: true|
|description|inteder|null: false|
|state_id|inteder|null: false,foreign_key: true|
|status_id|inteder|null: false,foreign_key: true|
### Association
- has_many :comments,　dependent: :destroy
- has_many :likes, dependent: :destroy
- belongs_to :user
- has_one :order
- has_one :status
- belongs_to :state
- belongs_to :category

## comment
|Column|Type|Options|
|------|----|-------|
|id|inteder||
|comment_text||
|product_id|inteder|foreign_key: true|
|user_id|inteder|foreign_key: true|
### Association
- belongs_to :user
- belongs_to:product

## review
|Column|Type|Options|
|------|----|-------|
|id|inteder||
|rating|string||
|trading_id|inteder|foreign_key: true|
### Association
- belogs_to :trading

## like
|Column|Type|Options|
|------|----|-------|
|id|inteder||
|user_id|inteder|foreign_key: true|
|product_id|inteder|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## tradindg
|Column|Type|Options|
|------|----|-------|
|id|inteder||
|seller_id|inteder|foreign_key: true|
|buyer_id|inteder|foreign_key: true|
### Association
-belongs_to :user
- has_many :reviws
- has_many :orders

## order
|Column|Type|Options|
|------|----|-------|
|id|inteder||
|product_id|inteder|foreign_key: true|
|trading_id|inteder|foreign_key: true|
### Association
- has_one :product
- belongs_to :trading

## category
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|name|string|null: false|
|children_id|inteder|null: false,foreign_key: true|
|grand children_id|inteder|null: false,foreign_key: true|
### Association
- has_one :products

## children
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|name|string|null: false|
|children-id|inteder|null: false,foreign_key: true|
### Association
- has_one :category

## grand children
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|name|string|null: false|
|grand children_id|inteder|foreign_key: true
### Association
- has_one : children
- has_one : shipping

## status
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string||
### Association
- has_many :products
- has_one :state

## state
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string||
### Association
- has_many :products

## size
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string||
### Association
- has_many :products

## brabd
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string||
|brand_group_id|integer|foreign_key: true|
### Association
- belongs_to : brand_group

## brand_group
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string||
### Association
- has_many:brands

## image
|Column|Type|Options|
|------|----|-------|
|id|integer||
|product_id|integer|foreign_key: true|
|image_url|string||
### Association
- belongs_to :product

## shipping
|Column|Type|Options|
|------|----|-------|
|delivary_method|string|null: false|
|prefecture_from|string|null: false|
|preiod|string|null: false|
|delivaryfee|string|null: false|
|id|integer|null: false|
### Association
- has_one :status

## sns_credentials
|Column|Type|Options|
|------|----|-------|
|id|integer||
|user_id|integer|foreign_key: true|
|priod|string||
### Association
- belogs_to :user

## creditcard
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|cardnumber|string|null: false|
### Association
- has_one :user

## seller
|Column|Type|Options|
|------|----|-------|
|id|inteder||
|buyer_id|inteder|foreign_key: true|
### Association
- has_one :buyer

## buyer
|Column|Type|Options|
|------|----|-------|
|seller_id|inteder|foreign_key: true|
|id|inteder||
### Association
- has_one :seller