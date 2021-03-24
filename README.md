##アプリ名


































# テーブル設計

## usersテーブル


| Column              | Type    | Options                   |
| ------------------- | --------| --------------------------|
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| read_first_name     | string  | null: false               |
| read_last_name      | string  | null:false                |

### Association
- has_many  :items
- belongs_to :location

## itemsテーブル

| Column             | Type       |     Options                    |
| ---------------    | ---------- | ------------------------------ |
| information_name   | string     | null: false                    |
| description        | text       | null: false                    |
| theft_day          | date       | null: false                    |
| prefecture_id      | integer    | null: false                    | 
| theft_place_id     | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
-belongs_to :user
-has_one :map

 
 ## mapsテーブル

| Column             | Type       |     Options                    |
| ------------------ | --------   | -------------------------      |                       
|address             | string     | null: false                    |
| latitude           | float      | null: false                    |
| longitude          | float      | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :item
