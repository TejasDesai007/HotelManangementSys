$(document).ready(function () {
    // Initialize Select2 for the select element
    $('.select2').select2({
        width: '100%' // Make sure the select dropdown takes full width
    });

    // Listen for changes on the room type select
    $('#slcRoomType').change(function () {
        setRoomPrice(); // Set room price when room type changes
    });
});

function setRoomPrice() {
    var selectedOption = document.getElementById('slcRoomType').selectedOptions[0];

    // Check if the element exists before accessing
    var priceElement = document.getElementById('txtRoomPrice');
    if (priceElement) {
        var price = selectedOption.getAttribute('data-price'); // Get the price from the data attribute
        priceElement.value = price; // Set the room price in the textbox
    } else {
        console.error('Element with id "txtRoomPrice" not found');
    }
}
