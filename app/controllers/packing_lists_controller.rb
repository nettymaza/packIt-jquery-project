class PackingListController < ApplicationController
  before_action :set_packing_list, only: [:show]

  def index
    @packing_list = PackingList.all
  end

  def show
    @packing_list_item = @packing_list.packing_list_item.build
  end

  def new
    @packing_list = PackingList.new
  end

  def create
    @packing_list = PackingList.new(packing_list_params)
    @packing_list.user = current_user

    if @packing_list.save
      redirect_to packing_list_path(@packing_list)
    else
      @packing_list = PackingList.all
      render :show
    end
  end

  private

  def set_packing_list
    @packing_list = PackingList.find(params[:id])
  end

  def packing_list_params
      params.require(:packing_list).permit(:name)
  end
end
