class RoomsTag
  include ActiveModel::Model
  attr_accessor :heading, :category_id, :user_id, :name

    
  validates :heading, presence: true
  validates :category_id, numericality: {other_than:1}

  def save
    room = Room.create(heading: heading, category_id: category_id, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    RoomTagRelation.create(room_id: room.id, tag_id: tag.id)
  end
end