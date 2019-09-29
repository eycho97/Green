require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:subcat_items)
  should have_many(:subcats).through(:subcat_items)
  should have_many(:starred_items)
  should have_many(:users).through(:starred_items)

  # test "the truth" do
  #   assert true
  # end
end
