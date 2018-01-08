class PackingListController < ApplicationController
  before_action :set_packing_list, only: [:show]

  def show
    @packing_list_item = @packing_list.packing_list_item.build
  end

  def new
    @packing_list = PackingList.new
  end

  def create
  end

  private

  def set_packing_list
    @packing_list = PackingList.find(params[:id])
  end
end
