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
