class Category < ActiveHash::Base
  self.data = [
    {id:1,name:"--"},
    {id:2,name:"アニメ"},
    {id:3,name:"漫画"},
    {id:4,name:"ゲーム"},
  ]

  include ActiveHash::Associations
  has_many :rooms
end
