class PackingListItemsController < ApplicationController
  def create
      # Find item parent (list it belongs to)
      @packing_list = PackingList.find(params[:packing_list_id])
      @packing_list_item = @packing_list.packing_list_items.build(item_params)
      @packing_list_item.save
      redirect_to packing_list_path(@packing_list)
  end

  private

  def item_params
      params.require(:packing_list_item).permit(:name)

  end
end
