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

## rooms テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| heading     | string     | null: false       |
| category_id | integer    | null: false       | 
| user        | references | foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_many :tags, through :rooms_tags
- has_many :rooms_tags

## commentsテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| text       | string     | null: false       |
| related_id | integer    | null: false       |
| good       | integer    | null: false       |
| user       | references | foreign_key: true |
| room       | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :room

## tagsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :rooms, through :rooms_tags
- has_many :rooms_tags

## rooms_tagsテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| room   | references | foreign_key: true |
| tag    | references | foreign_key: true |

### Association

- belongs_to :room
- belongs_to :tag