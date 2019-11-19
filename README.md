## アプリケーション

freemarket_sample_60e 

## URL

http://3.114.71.144/

## 概要

某フリマアプリのクローンサイト

## 機能一覧

- ユーザーの新規会員登録、ログイン機能、SNS認証機能
- 商品の出品、出品した商品の編集機能
- 商品の購入機能、pay.jpを用いたクレジット決済機能
- 商品検索機能
- カテゴリー機能
- マイページ機能、登録内容の編集機能

## 技術一覧

- ruby 2.5.1p57 (2018-03-29 revision 63029)
- Rails 5.2.3
- haml/scss/javascript/jquery
- AWS/Unicorn/Ngix/Mysql/Capistrano
- GitHubs/slack/trello


# freemarket_sample_60e DB設計
## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unipue: true|
|email|string|null: false,unipue: true|
|password|string|null: false|
|avator|string||
|callout|string||
|self_introduction|string||
### Association
- has_many :products
- has_many :tradings
- has_many :comments
- has_many :likes
- has_many :snscredentials, dependent: :destroy
- has_one :creditcard
- has_one :profile

## profile
|Column|Type|Options|
|------|----|-------|
|user_id|inteder|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|last_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|tel|string||
|zipcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|district|string|null: false|
|building|string||
### Association
- belongs_to :user, optional: true
- has_many :products

## products
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|description|text|null: false|
|image|text|null: false|
|saller_id|integer||
|category_id|integer||
|brand_id|integer||
|image_id|integer||
|delivery fee|string||
|buyer|string||
|shopping_area|string||
|shopping_days|string||
|user_id|integer||
|buyer_id|inteder||
|profile_id|inteder||
### Association
- has_many :comments
- has_many :likes
- has_many :images, foreign_key: :product_id, dependent: :destroy
- belongs_to :order, optional: true
- belongs_to :category, optional: true
- has_one :category,  dependent: :destroy
- has_one :status,  dependent: :destroy
- has_one :brand,  dependent: :destroy
- belongs_to :user
- belongs_to :profile, optional: true

## comment
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|comment|text|null: false|
|product_id|inteder||
|user_id|inteder||
### Association
- belongs_to :user
- belongs_to :product

## review
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|rating|string|null: false|
|trading_id|inteder||
### Association
- belogs_to :trading

## like
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|user_id|inteder||
|product_id|inteder||
### Association
- belongs_to :user
- belongs_to :product

## tradindg
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|seller_id|inteder||
### Association
- has_many :reviws
- has_many :orders

## order
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|product_id|inteder||
|trading_id|inteder||
### Association
- belongs_to :product

## category
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|name|string|null: false|
|children_id|inteder||
|grand children_id|inteder||
### Association
- has_many :products
has_ancestry
- belongs_to :child, optional: true

## child
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|name|string|null: false|
|grandchildren-id|inteder||
### Association
- belongs_to :category
- has_many :grandchild

## grandchild
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|name|string|null: false|
### Association
- belongs_to :category
- belongs_to :child

## status
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|
### Association
- has_many :products
- has_one :shopping

## state
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|
### Association
- has_many :products

## size
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string||
### Association
- has_many :products

## brand
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string||
|brand_group_id|integer||
|product_id|integer||
### Association
- has_many :products

## brand_group
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string||
### Association
- has_many :brands

## image
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|product_id|integer||
|image_url|string||
### Association
- belongs_to :product, optional: true

## shipping
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|delivary_method|string|null: false|
|prefecture_from|string|null: false|
|preiod|string|null: false|
|delivary|string|null: false|
### Association
- has_one :status

## sns_credentials
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer||
|provider|string||
|uid|stirng||
### Association
- belongs_to :user, optional: true

## creditcard
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false,foreign_key: true|
|cardnumber|string|null: false|
|validity_month|integer|null: false|
|validity_day|integer|null: false|
|security_number|integer|null: false|
### Association
- belongs_to :user, optional: true

## seller
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|user_id|integer||
### Association
- has_one :buyer

## buyer
|Column|Type|Options|
|------|----|-------|
|id|inteder|null: false|
|user_id|inteder||
### Association
- has_one :seller