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
- has_many :users_buys
- has_many :buys, through: users_buys
- has_many :address

users_buysテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| buy           | references | null: false, foreign_key: true |


Association

- belongs_to :buys
- belongs_to :users

 buys テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| productctname      | string  | null: false |
| productdescription | text    | null: false |
| category           | text    | null: false |
| productstatus      | text    | null: false |
| shipping           | text    | null: false |
| shippingday        | text    | null: false |
| price_id           | integer | null: false |

Association

- has_many :users_buys
- has_many :buys, through: users_buys
- has_many :address

 address テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| postalcode         | stiring | null: false |
| prefectures_id     | integer | null: false |
| city               | stiring | null: false |
| address            | stiring | null: false |
| buildingname       | stiring | null: false |
| phonenumber        | integer | null: false |

Association

belongs_to :users
belongs_to :buys

