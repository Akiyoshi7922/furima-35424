# テーブル設計

  users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| name         | string | null: false |
| namekana     | string | null: false |
| year         | string | null: false |
| month        | string | null: false |
| day          | string | null: false |

Association

- has_many :login
- has_many :trade

 login テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |

Association

- has_many :trade

 trade テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| productctname      | string | null: false |
| productdescription | text   | null: false |
| category           | text   | null: false |
| productstatus      | text   | null: false |
| shipping           | text   | null: false |
| shippingarea       | text   | null: false |
| shippingday        | text   | null: false |
| price              | text   | null: false |

Association

- belongs_to :login