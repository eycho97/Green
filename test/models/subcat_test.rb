require 'test_helper'

class SubcatTest < ActiveSupport::TestCase

  # test relationships
  should belong_to(:category)
  should have_many(:subcat_items)
  should have_many(:items).through(:subcat_items)

  # test "the truth" do
  #   assert true
  # end
end
