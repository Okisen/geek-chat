class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :likes

  with_options presence: true do
    validates :text
    validates :related_id
  end
end
