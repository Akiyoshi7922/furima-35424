# テーブル設計

  users テーブル

| Column        | Type   | Options                   |
| ------------- | ------ | ------------------------- |
| nickname      | string | null: false               |
| email         | string | null: false, unique: true |
| password      | string | null: false               |
| lastname      | string | null: false               |
| firstname     | string | null: false               |
| lastnemekana  | string | null: false               |
| firstnamekana | string | null: false               |
| year          | date   | null: false               |

Association
- has_many :users_bys
- has_many :bys, through: users_by
- has_many :address

users_bysテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| by            | references | null: false, foreign_key: true |


Association

- belongs_to :bys
- belongs_to :users

 bys テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| productctname      | string  | null: false |
| productdescription | text    | null: false |
| category           | text    | null: false |
| productstatus      | text    | null: false |
| shipping           | text    | null: false |
| shippingarea       | text    | null: false |
| shippingday        | text    | null: false |
| price_id           | integer | null: false |

Association

- has_many :users_bys
- has_many :bys, through: users_bys
- has_many :address

 address テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| kard               | integer | null: false |
| expirationdate     | date    | null: false |
| security           | integer | null: false |
| postalcode         | stiring | null: false |
| prefectures        | stiring | null: false |
| city               | stiring | null: false |
| address            | stiring | null: false |
| buildingname       | stiring | null: false |
| phonenumber        | integer | null: false |

Association

belongs_to :users
belongs_to :bys

