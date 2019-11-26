class CategoriesController < ApplicationController
  
  before_action :set_category, only: [:show, :edit, :update]
  before_action :check_login, only: [:edit, :update, :destroy, :new, :create]
  authorize_resource

  def index
    @active_cats = Category.active.all
    @inactive_cats = Category.inactive.all
  end

  def new
    @cat = Category.new
  end

  def create
    @cat = Category.new(category_params)
    if @cat.save
      redirect_to categories_path, notice: "Category #{@cat.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def show
    @cat_subcats = @cat.subcats.all
  end

  def edit
  end

  def update
    if @cat.update(category_params)
      redirect_to categories_path, notice: "Category #{@cat.name} was updated."
    else
      render action: 'edit'
    end
  end

  # def destroy
  # end

  private

  def set_category
    @cat = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :active)
  end
end
