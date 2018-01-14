
def items_attributes=(item_attributes)
  item_attributes.each do |item_attribute|
    if !item_attribute.empty?
      if new_item = Item.find_by(item_attribute)
      self.items << new_item
      else
      self.items.build(:items_attribute => [:name])
      end
    end
  end
end


<div class="field">
  <h3>Create Packing List</h3>
  <h5><i>Add Items to List</i></h5>
  <br>
  <% 3.times.each do %>
    <%= f.fields_for :items, @trip.items.build do |trip_fields| %>
      <%= trip_fields.text_field :name %>
    <% end %>
  <% end %>
</div>
