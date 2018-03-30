$(document).ready(function () {
  $("a.load_trips").on("click", getTripsData)
})

function getTripsData(e) {
    e.preventDefault()
    $('#trips-container').html('')
    $.getJSON(this.href, function(tripsData) {
        renderTripsData(tripsData)
    })
}

function renderTripsData(tripsData) {
    tripsData.forEach(trip => {
        let newTrip = new Trip(trip)
        console.log(newTrip)
        let tripHtml = newTrip.indexTemplate()
        $('#trips-container').append(tripHtml)
    })
}

function Trip(trip) {
    this.id = trip.id
    this.name = trip.name
    this.duration = trip.duration
    this.start_date = trip.start_date
}

Trip.prototype.indexTemplate = function() {
    let tripHtml = `
    <a href="/trips/${ this.id }">
      <h3>${ this.name }</h3>
    </a>
    `
    return tripHtml
}
