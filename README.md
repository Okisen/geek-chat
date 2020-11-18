# README

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