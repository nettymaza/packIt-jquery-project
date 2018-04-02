// Submit Packing List items on Trips show page via Ajax


$(document).ready(function () {
    $(".edit_trip").submit(function(e) {
        // Need url to submit the POST request to
        // Need form data

        $.ajax({
            method: 'POST',
            url: this.action,
            data: $(this).serialize(),
            success: renderPackingListItems,
            dataType: 'json'
        })

        e.preventDefault()
    })
})

function renderPackingListItems(trip) {
    let itemsHtml = ''
    trip.items.forEach(function(item) {
        itemsHtml += `<li>${item.name}</li>`
    })

    $('.tripItems').html(itemsHtml)
    $('.edit_trip').find('input[type="text"]').val('')
}
