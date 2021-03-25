
## アプリ名

Car Chaser

## 概要

車の盗難にあった当事者同士で情報を共有するアプリ。

## 本番環境

## 制作背景(意図)

現在、車の盗難に万が一遭遇してしまった場合、ほとんどの場合持ち主の元に返ってこない問題を解決に役立てるアプリを制作したいと制作しました。

## DEMO
![Uploading Car.chaser![car-chase画像](https://user-images.githubusercontent.com/78330447/112422438-3c296280-8d74-11eb-923c-14d9db4b52df.jpg)
 gps画像.jpg…]()




## 工夫したポイント

Google maps platform を用いて入力した文字情報を元に地図に位置を表示し、DBに情報を保存する機能を実装した点。
これにより視覚的に盗難にあった場所を利用者全体で共有することができることを意図しています。

## 使用技術

### バックエンド

Ruby, Ruby on rails 

### フロントエンド

Html, JavaScript

## DB設計

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
