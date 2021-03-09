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
- has_many :items
- has_many :maps

## itemsテーブル

| Column             | Type       |     Options                    |
| ---------------    | ---------- | ------------------------------ |
| information_name   | string     | null: false                    |
| theft_day          | date       | null: false                    |
| prefecture_id      | integer    | null: false                    | 
| user               | references | null: false, foreign_key: true |

### Association
-belongs_to :user
 

 ## mapsテーブル

| Column             | Type     |     Options               |
| ------------------ | -------- | ------------------------- |                       
| text               | text     | null:false                |

### Association
- belongs_to :user