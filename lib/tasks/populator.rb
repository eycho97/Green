# require needed files
require './lib/tasks/helpers/categories'
require './lib/tasks/helpers/customers'
require './lib/tasks/helpers/employees'
require './lib/tasks/helpers/items'
require './lib/tasks/helpers/subcats'
require './lib/tasks/helpers/subcat_items'

module Populator
  include Populator::Categories
  include Populator::Customers
  include Populator::Employees
  include Populator::Items
  include Populator::Subcats
  include Populator::SubcatItems
end
