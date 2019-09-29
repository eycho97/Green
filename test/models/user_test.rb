require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:starred_items)
  should have_many(:items).through(:starred_items)
  
  # test "the truth" do
  #   assert true
  # end
end
