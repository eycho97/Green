class SubcatsController < ApplicationController

  before_action :set_subcat, only: [:show, :edit, :update]
  before_action :check_login, only: [:edit, :update, :destroy, :new, :create]
  authorize_resource

  def index
    @active_subcats = Subcat.active.alphabetical.all
    @inactive_subcats = Subcat.inactive.alphabetical.all
  end

  def new
    @subcat = Subcat.new
  end

  def create
    @subcat = Subcat.new(subcat_params)
    if @subcat.save
      redirect_to subcats_path, notice: "Sub Category #{@subcat.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def show
    @subcat_items = @subcat.subcat_items.all
  end

  def edit
  end

  def update
    if @subcat.update(subcat_params)
      redirect_to subcats_path, notice: "Sub Category #{@subcat.name} was updated."
    else
      render action: 'edit'
    end
  end

  # def destroy
  # end

  private

  def set_subcat
    @subcat = Subcat.find(params[:id])
  end

  def subcat_params
    params.require(:subcat).permit(:category_id, :name, :active)
  end
end
