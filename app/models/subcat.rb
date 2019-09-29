class Subcat < ApplicationRecord

  #Relationships
  belongs_to :category
  has_many :subcat_items
  has_many :items, through: :subcat_items

end
