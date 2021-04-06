
## アプリ名

Car Chaser

## 概要

車の盗難にあった当事者同士で情報を共有するアプリ。

## 本番環境

https://car-chaser.herokuapp.com/

## テスト用アカウント

  ### Basic認証
  - ユーザー名: rider
  - パスワード: 5656

  ### アカウント
  - メールアドレス: a@com
  - パスワード: a12345

## 制作背景(意図)

現在、車の盗難に万が一遭遇してしまった場合、ほとんどの場合持ち主の元に返ってこない問題があります。
その解決に役立てるアプリを制作したいと思い、制作しました。

## DEMO

  ### トップページ
  [![Image from Gyazo](https://i.gyazo.com/44d4a3ad5e4292228b5317c83448ee76.jpg)](https://gyazo.com/44d4a3ad5e4292228b5317c83448ee76)

  ログインした状態で提供するボタンを押して頂きますと提供画面に遷移します。
  こちらに提供して頂いた情報を表示します。

  ### 提供ページ
  [![Image from Gyazo](https://i.gyazo.com/06ac0ef2e8862480dc9e947ecff8fb69.png)](https://gyazo.com/06ac0ef2e8862480dc9e947ecff8fb69)
   
   情報を入力して頂きますと地図情報提供画面に遷移します。

   ### 地図提供ページ
   [![Image from Gyazo](https://i.gyazo.com/bee33525d23757badd040ea43abddc63.png)](https://gyazo.com/bee33525d23757badd040ea43abddc63)

   地名を入力して頂きますと地図詳細画面に遷移します。

   ### 地図詳細ページ
  [![Image from Gyazo](https://i.gyazo.com/c37b7e903b317e4e6dfd5151295a0a77.jpg)](https://gyazo.com/c37b7e903b317e4e6dfd5151295a0a77)

  入力して頂いた情報から地図を表示します。
  また、編集ができます。登録後はトップ→詳細画面→地図詳細ページの順で遷移できます。
 
  ### 詳細ページ
  [![Image from Gyazo](https://i.gyazo.com/306021563968fe459e9768d9424919c7.png)](https://gyazo.com/306021563968fe459e9768d9424919c7)

  トップページに表示された登録情報にクリックすると遷移します。
  こちらで編集、削除、コメントが出来ます。また、先ほどの地図詳細ページに遷移できます。



## 工夫したポイント

Google maps platform を用いて入力した文字情報を元に地図情報を表示し、DBにその情報を保存する機能を実装した点。
これにより視覚的に盗難にあった場所を利用者全体で共有することができるようにしました。

## 使用技術

### バックエンド

Ruby, Ruby on rails 

### フロントエンド

Html, JavaScript


## 課題や今後実装したい機能

  ### 課題
  - 提供された情報が多くなった際、必要な情報へのアクセスがしずらくなる。
  - 提供画面から地図画面に遷移する点が助長。
  - ページの読み込みが少し遅い。

  ## 実装したい機能
  - 一覧表示をページ制にする。それに伴って検索機能も実装する。
  - インフラをAWSに変更する
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