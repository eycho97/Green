require 'test_helper'

class SubcatItemTest < ActiveSupport::TestCase

  # test relationships
  should belong_to(:subcat)
  should belong_to(:item)
  
  # test "the truth" do
  #   assert true
  # end
end
