<!-- <% if false @trip.packing_list_items %> -->
    <!-- Render all items in the packing list. -->
<!-- <% else %>
    <p>You currently have no items in your packing list. Please add some in the form below.</p>
<% end %>
<hr>
<h3>Add an item to your list</h3>
<form action="">
    <label for="">Item Name</label>
    <input type="text">
    <input type="submit" value="submit"> -->



    


Notes on PackingList with Items


PackingList
has_many :packing_list_items
packing_list.packing_list_items.create(:name => "Shoes")

PackingListItems
belongs_to :packing_list

attributes:
name
packing list id

Building out NestedForm

We want a
POST /packing_list/:id/packing_list_items
Nest Resource: packing_list_items are nested in terms of URL under their parent list
