module Contexts
  module CustomerContexts
        
    def create_customers
      @bob = FactoryBot.create(:user, first_name: "Bob", last_name: "Park", email: "bobpark@gmail.com", username: "bobpark")
      @mike = FactoryBot.create(:user, first_name: "Mike", last_name: "Kim", email: "mikekim@gmail.com", username: "mikekim")
      @israel = FactoryBot.create(:user, first_name: "Israel", last_name: "Madueme", email: "imadueme@gmail.com", username: "imadueme")
      @darian = FactoryBot.create(:user, first_name: "Darian", last_name: "Fard", email: "dfard@gmail.com", username: "dfard", active: false)
      @tim = FactoryBot.create(:user, first_name: "Tim", last_name: "Cook", email: "timcook@gmail.com", username: "timcook", active: false)
    end

    def delete_customers
      @bob.delete
      @mike.delete
      @israel.delete
      @darian.delete
      @tim.delete
    end
    
  end
end