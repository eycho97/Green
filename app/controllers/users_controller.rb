class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_login, only: [:show, :edit, :update]
  authorize_resource

  def index
    @active_employees = User.employees.active.alphabetical.all
    @inactive_employees = User.employees.inactive.alphabetical.all
    @active_customers = User.customers.active.alphabetical.all
    @inactive_customers = User.customers.inactive.alphabetical.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "#{@user.proper_name} was added to the system."
    else
      render action: 'new'
    end
  end

  def show
    @starred_items = @user.starred_items.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Successfully updated #{@user.proper_name}."
    else
      render action: 'edit'
    end
  end

  # def destroy
  # end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :role, :active)
  end
end
