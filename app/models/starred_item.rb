class StarredItem < ApplicationRecord

  #Relationships
  belongs_to :user
  belongs_to :item
end
