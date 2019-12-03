class StarredItemsController < ApplicationController
  
  before_action :check_login
  authorize_resource

  def index
    @starred_items = StarredItem.all
    if (logged_in? && current_user.role?(:customer))
      @my_starred = current_user.starred_items.all
    end
  end

  def new
    @star = StarredItem.new
  end

  def create
    @star = StarredItem.new(starred_item_params)
    if @star.save
      redirect_to user_path(@star.user)
    else
      render action: 'new'
    end
  end

  # def destroy
  # end

  private

  def starred_item_params
    params.require(:starred_item).permit(:user_id, :item_id)
  end
  
end
