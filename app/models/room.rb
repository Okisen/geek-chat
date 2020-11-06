class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_many :comments
  
  validates :heading, presence: true
  validates :category_id, numericality: {other_than:1}
end
