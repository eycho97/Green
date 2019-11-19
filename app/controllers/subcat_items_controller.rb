class SubcatItemsController < ApplicationController

  def index
    @all_subcat_items = SubcatItem.all
  end

  def new
    @subitem = SubcatItem.new
  end
  

  def create
    @subitem = SubcatItem.new(subcat_item_params)
    if @subitem.save
      redirect_to item_path(@subitem.item)
    else
      render action: 'new'
    end
  end

  private

  def subcat_item_params
    params.require(:subcat_item).permit(:subcat_id, :item_id)
  end

end
