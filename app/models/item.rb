class Item < ApplicationRecord

  #Relationships
  has_many :subcat_items
  has_many :subcats, through: :subcat_items
  has_many :starred_items
  has_many :users, through: :starred_items

end
