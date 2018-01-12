<% 6.times.each do %>
  <%= f.fields_for :items, @trip.items.build do |items_fields| %>
  <%= items_fields.text_field :name %>
  <% end %>
<% end %>

<div class="field">
  <h3>Create Packing List</h3>
  <h5><i>Add Items to List</i></h5>
  <br>
  <%= f.collection_check_boxes :item_ids, Item.all, :id, :name %>
  <%= f.fields_for :items, @trip.items.build do |trip_fields| %>
    <%= trip_fields.text_field :name %>
  <% end %>
</div>


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

#packing list show

<h1><%= @packing_list.name %></h1>

<!-- packing_list_items_path(@packing_list) -->
<%= form_for([@packing_list, @packing_list_item]) do |f| %>
  <%= f.text_field :name %>
  <%= f.submit %>
<% end %>

<ul>
  <% @packing_list.packing_list_items.each do |item| %>
    <li>
      <%= item.name %>
    </li>
  <% end %>
</ul>
