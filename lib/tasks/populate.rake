namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Step 0: initial set-up
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate to set up db structure based on latest migrations
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke

    # Get the faker gem (see docs at http://faker.rubyforge.org/rdoc/)
    require 'factory_bot_rails' 

    # Create Categories
    create_categories

    # Create Subcats
    create_subcats

    # Create Items
    create_items

    # Create Employees
    create_employees

    # Create Customers
    create_customers
    
          
  end
end
