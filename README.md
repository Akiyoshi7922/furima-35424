# テーブル設計

  users テーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| encryptedpassword | string | null: false               |
| lastname          | string | null: false               |
| firstname         | string | null: false               |
| lastnamekana      | string | null: false               |
| firstnamekana     | string | null: false               |
| year              | date   | null: false               |

Association
- has_many :buys, through: users_buys

users_buysテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| buy           | references | null: false, foreign_key: true |


Association

- belongs_to :buy
- has_one :address

 buys テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| productctname      | string     | null: false                    |
| productdescription | text       | null: false                    |
| category_id        | integer    | null: false                    |
| productstatus_id   | integer    | null: false                    |
| shipping_id        | integer    | null: false                    |
| city_id            | integer    | null: false                    |
| shippingday_id     | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

Association

- belongs_to : user, through: users_buys

 address テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| postalcode         | string  | null: false |
| city_id            | integer | null: false |
| city               | string  | null: false |
| address            | string  | null: false |
| buildingname       | string  |             |
| phonenumber        | string  | null: false |

Association

belongs_to :buys
belongs_to :users_buys

