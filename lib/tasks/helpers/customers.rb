module Populator
  module Customers
      
    require 'faker'
    
    def create_customers
      @bob = FactoryBot.create(:user, first_name: "Bob", last_name: "Park", email: "bobpark@gmail.com", username: "bobpark")
      @mike = FactoryBot.create(:user, first_name: "Mike", last_name: "Kim", email: "mikekim@gmail.com", username: "mikekim")
      @israel = FactoryBot.create(:user, first_name: "Israel", last_name: "Madueme", email: "imadueme@gmail.com", username: "imadueme")
      @darian = FactoryBot.create(:user, first_name: "Darian", last_name: "Fard", email: "dfard@gmail.com", username: "dfard", active: false)
      @tim = FactoryBot.create(:user, first_name: "Tim", last_name: "Cook", email: "timcook@gmail.com", username: "timcook", active: false)

      # 40.times do |i|
      #   fn = Faker::Name.first_name
      #   ln = Faker::Name.last_name
      #   em = Faker::Internet.email
      #   FactoryBot.create(:user, first_name: "#{fn}", last_name: "#{ln}", email: "#{em}", username: "#{fn}")
      # end

    end
  end
end