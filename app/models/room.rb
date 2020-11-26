class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :room_tag_relations
  has_many :tags, through: :room_tag_relations
end
