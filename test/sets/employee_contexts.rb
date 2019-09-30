module Contexts
  module EmployeeContexts

    def create_employees
      @iman = FactoryBot.create(:user, first_name: "Iman", last_name: "Fard", email: "imanf@gmail.com", username: "imanf", role: "admin")
      @alec = FactoryBot.create(:user, first_name: "Alec", last_name: "Lam", email: "alam@gmail.com", username: "alam", role: "manager")
      @matt = FactoryBot.create(:user, first_name: "Matt", last_name: "Lee", email: "mlee@gmail.com", username: "mlee", role: "manager")
    end

    def delete_employees
      @iman.delete
      @alec.delete
      @matt.delete
    end
    
  end
end