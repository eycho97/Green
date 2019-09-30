# require needed files
require './test/sets/category_contexts'
require './test/sets/subcat_contexts'
require './test/sets/item_contexts'
require './test/sets/employee_contexts'
require './test/sets/customer_contexts'
require './test/sets/subcat_item_contexts'
require './test/sets/starred_item_contexts'


module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::CategoryContexts
  include Contexts::SubcatContexts
  include Contexts::ItemContexts
  include Contexts::EmployeeContexts
  include Contexts::CustomerContexts
  include Contexts::SubcatItemContexts
  include Contexts::StarredItemContexts
end
