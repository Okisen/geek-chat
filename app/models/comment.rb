class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :text
    validates :related_id
    validates :good
  end
end
