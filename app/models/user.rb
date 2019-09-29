class User < ApplicationRecord

  #Relationships
  has_many :starred_items
  has_many :items, through: :starred_items

end
