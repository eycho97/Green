class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update]
  before_action :check_login, only: [:edit, :update, :destroy, :new, :create]
  authorize_resource

  def index
    @active_items = Item.active.alphabetical.all
    @inactive_items = Item.inactive.alphabetical.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item), notice: "Successfully added #{@item.title} to the system."
    else
      render action: 'new'
    end
  end

  def show
    @starred = @item.starred_items.all
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "Successfully updated #{@item.title}."
    else
      render action: 'edit'
    end
  end

  # def destroy
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :blurb, :description, :picture, :link, :featured, :active)
  end
end
