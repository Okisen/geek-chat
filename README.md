# README

# アプリケーション名
　geek-chat31780
# アプリケーション概要
  特定の話題にてついてルームを作成し、そのルーム内で匿名のコメントを残すことができます。
# URL
  https://geek-chat31780.herokuapp.com/
# テスト用アカウント
  email:sample@sample
  password:sample1
# 利用方法
  ユーザー登録後、ルーム作成とコメント機能が使えるようになります。
  ユーザー未登録の場合、コメント閲覧のみ行えます。
# 目指した課題解決
  漫画を読むことを趣味にしている人が、特定の話題(例:今週のワンピース)について匿名で気兼ねなく語り合う場を提供すること
# 洗い出した要件
- 部屋作成機能
- ユーザー登録機能
- コメント機能
- いいね機能
- お気に入り機能
- 検索機能
- タグ付け機能
- 返信機能
# 実装予定の機能
- お気に入り機能
- 検索機能
- 返信機能
# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string |             |
| email              | string | null: false |
| encrypted_password | string | null: false |


### Association

- has_many :comments
- has_many :rooms
- has_many :likes

## rooms テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| heading     | string     | null: false       |
| category_id | integer    | null: false       | 
| user        | references | foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_many :tags, through :room_tag_relations
- has_many :room_tag_relations

## commentsテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| text       | string     | null: false       |
| related_id | integer    | null: false       |
| user       | references | foreign_key: true |
| room       | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :room
- has_many :likes

## likesテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| comment    | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :comment

## tagsテーブル

| Column | Type   | Options          |
| ------ | ------ | ---------------- |
| name   | string | uniqueness: true |

### Association

- has_many :rooms, through :room_tag_relations
- has_many :room_tag_relations

## room_tag_relationsテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| room   | references | foreign_key: true |
| tag    | references | foreign_key: true |

### Association

- belongs_to :room
- belongs_to :tag