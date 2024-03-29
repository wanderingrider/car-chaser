
## アプリ名

Car Chaser

## 概要

車の盗難にあった当事者同士で情報を共有するアプリ。

## 制作背景(意図)

現在、車の盗難に万が一遭遇してしまった場合、ほとんどの場合持ち主の元に返ってこない問題があります。
その解決に役立てるアプリを制作したいと思い、制作しました。

## DEMO

  ### トップページ
  [![Image from Gyazo](https://i.gyazo.com/098af3175a919f2e3b6aafb50740d974.jpg)](https://gyazo.com/098af3175a919f2e3b6aafb50740d974)

  ### 情報一覧
  [![Image from Gyazo](https://i.gyazo.com/e7f58a5a9aecc15a5f800b9bda1409aa.jpg)](https://gyazo.com/e7f58a5a9aecc15a5f800b9bda1409aa)
  ログインした状態で提供するボタンを押して頂きますと提供画面に遷移します。
  こちらに提供して頂いた情報を表示します。

  ### 提供ページ
  [![Image from Gyazo](https://i.gyazo.com/06ac0ef2e8862480dc9e947ecff8fb69.png)](https://gyazo.com/06ac0ef2e8862480dc9e947ecff8fb69)
   
   情報を入力して頂きますと地図情報提供画面に遷移します。

   ### 地図提供ページ
   [![Image from Gyazo](https://i.gyazo.com/bee33525d23757badd040ea43abddc63.png)](https://gyazo.com/bee33525d23757badd040ea43abddc63)

   地名を入力して頂きますと地図詳細画面に遷移します。

   ### 地図詳細ページ
  [![Image from Gyazo](https://i.gyazo.com/41fe28cd74138b8804c10cfdc07e6695.jpg)](https://gyazo.com/41fe28cd74138b8804c10cfdc07e6695)
  入力して頂いた情報から地図を表示します。
  また、編集ができます。登録後はトップ→詳細画面→地図詳細ページの順で遷移できます。
 
  ### 詳細ページ
  [![Image from Gyazo](https://i.gyazo.com/d19fe2885aa435e412e3d21a07df204b.png)](https://gyazo.com/d19fe2885aa435e412e3d21a07df204b)

  トップページに表示された登録情報にクリックすると遷移します。
  こちらで編集、削除、コメント(非同期処理)が出来ます。また、先ほどの地図詳細ページに遷移できます。



## 工夫したポイント

Google maps platform を用いて入力した文字情報を元に地図情報を表示し、DBにその情報を保存する機能を実装した点。
これにより視覚的に盗難にあった場所を利用者全体で共有することができるようにしました。

## 使用技術

### バックエンド

Ruby, Ruby on rails 

### フロントエンド

Html, JavaScript

## 機能
- ログイン・ログアウト機能
- 一覧表示機能
- コメント機能(非同期化)
- 地図情報表示
- 検索機能
- ページネーション
- 詳細・編集・削除
- AWS 環境, 自動デプロイ

## 課題や今後実装したい機能

  ### 課題
  - 提供された情報が多くなった際、必要な情報へのアクセスがしずらくなる。
  - 提供画面から地図画面に遷移する点が冗長。

  ## 実装したい機能
  - 一つ一つの投稿に対して地図情報を載せるか選択できるようにする。

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
- has_many  :comments

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
- belongs_to :user
- has_many :maps
- has_many :comments

 
 ## mapsテーブル

| Column             | Type       |     Options                    |
| ------------------ | --------   | -------------------------      |                       
| address             | string     | null: false                   |
| latitude           | float      | null: false                    |
| longitude          | float      | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :item

## commentsテーブル

| Column             | Type       |     Options                    |
| ------------------ | --------   | ------------------------------ |                       
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item