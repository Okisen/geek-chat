class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :rooms
  has_many :comments
  has_many :likes

  def already_liked?(comment)
    self.likes.exists?(comment_id: comment.id)
  end
end
