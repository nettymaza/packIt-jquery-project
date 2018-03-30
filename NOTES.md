$.ajax({
  method: "GET",
  url: this.href,
}).done(function(response) {
  $('div.trips').html(response)
});


$(document).ready(function () {
  $("a.load_trips").on("click", getTripsData)
})

function getTripsData(e) {
  e.preventDefault()

  // Remove all content from .trips
  $('.trips').html('')

  $.get(this.href, function(tripsData) {
    renderTripsData(tripsData)
  })
}

function renderTripsData(tripsData) {
  tripsData.forEach(function(trip, tripIndex) {

    $('.trips').append(`
      <a href="/trips/${ trip.id }">
        <h3>${ trip.name }</h3>
      </a>
      `
    )
  })
}

$(document).ready(function () {
  $("a.load_trips").on("click", function(e) {
    e.preventDefault()

    $.get(this.href, function(tripsData) {
      renderTripsData(tripsData)
    })
  })
})

function renderTripsData(tripsData) {
  // Remove all content from .trips
  var $ul = $('div.trips ul')
  $ul.html("")

  tripsData.forEach(function(trip){
    $ul.append("<li>" + trip.name + "</li>")
  })
}

<!-- <br>
<hr>
<h3>Your other trips</h3>
<% current_user.trips.each do |trip| %>
  <% if trip != @trip %>
    <a href="/trips/<%= trip.id %>/data.json"><%= trip.name %></a>
  <% end %>ra
<% end %> -->
