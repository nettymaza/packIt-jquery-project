
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


<%= f.label "Category" %>
  <%= f.collection_check_boxes :category_ids, Category.all, :id, :name %>

  <!-- Form to add new Comment -->

<h3>Leave a Comment:</h3>
<%= form_for @post.comments.build do |f| %>
  <%= f.text_area :content %><br>
  <%= f.collection_select :user_id, User.all, :id, :username, include_blank: "Choose User" %>
  <%= f.hidden_field :post_id %>
  <%= f.fields_for :user, @post.comments.last.build_user do |user_fields| %>
    <%= user_fields.text_field :username %>
  <% end %>
<br>
<br>
<%= f.submit %>

flash.now[:notice] = 'Invalid email/password combination'
render 'new'


<% elsif !on_login_page? %>
    <%= link_to "Log in", login_path %>



      def index
        if params[:user_id]
          @trips = Trip.find(params[:user_id])
        else
          @trips = Trip.all
        end
      end
