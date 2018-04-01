$(document).ready(function () {
  getTripsData()
  showTrip()
  getNextTrip()
})

function getTripsData() {
    $("a.load_trips").on("click", function(e) {
        // history.pushState(null, null, "trips")
        e.preventDefault()
        $('#trips-container').html('')
        $.getJSON(this.href, function(tripsData) {
            renderTripsData(tripsData)
        })
    })
}

function renderTripsData(tripsData) {
    tripsData.forEach(trip => {
        let newTrip = new Trip(trip)
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
    <a href="/trips/${ this.id }" data-id="${this.id}" class="show_link">
      <h3>${ this.name }</h3>
    </a>
    `
    return tripHtml
}

function showTrip() {
    $(document).on('click', '.show_link', function(e) {
        e.preventDefault()
        $('#trips-container').html('')
        let id = $(this).attr('data-id')
        $.getJSON(`/trips/${id}.json`, renderTrip)
    })
}

function renderTrip(tripData) {
    let newTrip = new Trip(tripData)
    let tripHtml = newTrip.showTemplate()
    $('#trips-container').html(tripHtml)
}

Trip.prototype.showTemplate = function() {
    let tripHtml = `
    <h1>${ this.name }</h1>
    <h3>${ this.duration }</h3>
    <h3>${ this.start_date }</p>

    <button class="next-post" data-id="${ this.id }">Next</button>
    `
    return tripHtml
}

function getNextTrip() {
    $(document).on('click', '.next-post', function(e) {
        e.preventDefault()
        let id = $(this).attr('data-id')
        $.getJSON(`/trips/${id}/next`, function(tripData){
            renderTrip(tripData)
        })
    })
}
