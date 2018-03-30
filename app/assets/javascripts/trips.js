$(document).ready(function () {
  // $("a.load_trips").on("click", getTripsData)
  getTripsData()
  showTrip()
})

function getTripsData() {
    $("a.load_trips").on("click", function(e) {
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
        $.getJSON(`/trips/${id}.json`, function(showTrip) {
            let newTrip = new Trip(showTrip)
            let tripHtml = newTrip.showTemplate()
            $('#trips-container').append(tripHtml)

        })
    })
}


Trip.prototype.showTemplate = function() {
    let tripHtml = `
    <h1>${ this.name }</h1>
    <h3>${ this.duration }</h3>
    <h3>${ this.start_date }</p>
    `
    return tripHtml
}
