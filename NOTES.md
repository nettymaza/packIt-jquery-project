<% if !params[:author].blank? %>
  <% @posts = Post.where(author: params[:author]) %>
<% elsif !params[:date].blank? %>
  <% if params[:date] == "Today" %>
    <% @posts = Post.where("created_at >=?", Time.zone.today.beginning_of_day) %>
  <% else %>
    <% @posts = Post.where("created_at <?", Time.zone.today.beginning_of_day) %>
  <% end %>
<% end %>


<div>
  <h3>Filter Trips:</h3>
  <%= form_tag("/trips", method: "get") do %>
    <%= select_tag "Status", options_for_select(["Past Trips", "Upcoming Trips"]), include_blank: true %>
    <%= submit_tag "Filter" %>
  <% end %>
</div>


<%= form_for ([current_user, trip]) do |f| %>
<%= f.check_box :status, options = {:onChange => "javascript: this.form.submit();"}, checked_value = "1", unchecked_value = "0" %>
<% end %>


if !params[:status].blank?
  if params[:status] == "Past"
    @trips = Trip.complete
  else
    @trips = Trip.incomplete
  end
else
  @trips = Trip.all
end
