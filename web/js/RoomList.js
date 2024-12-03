$(document).ready(function () {
    // Fetch the room list as soon as the document is ready
    loadRoomList();

    // Listen for the Enter key on each textbox (input[type="text"])
    $('#inputTable input[type="text"]').on('keydown', function (event) {
        // Check if the key pressed is the Enter key (key code 13)
        if (event.keyCode === 13) {
            event.preventDefault();  // Prevent form submission or other default actions

            // Collect data from labels (headers) and textboxes (input fields) into JSON
            var data = {};

            // Loop through each row to collect label-textbox pairs
            $('#inputTable thead tr').each(function () {
                // Iterate over each td in the row
                $(this).find('td').each(function () {
                    var label = $(this).find('label').text().trim();  // Get the label text
                    var textbox = $(this).find('input[type="text"]'); // Get the associated textbox
                    if (textbox.length > 0) {
                        data[label] = textbox.val(); // Add label-textbox pair to JSON object
                    }
                });
            });
            console.log(JSON.stringify(data));

            // Send the JSON object to the backend using AJAX
            $.ajax({
                url: 'RoomListInnr.jsp', // URL of the servlet to process the data
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data), // Convert the JSON object to a string
                success: function (response) {
                    // On success, populate the table with the returned data
                    populateTable(response);
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        }
    });

    // Function to load the room list when the page loads
    function loadRoomList() {
        $.ajax({
            url: 'RoomListInnr.jsp', // URL to get all rooms when the page is loaded
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({}), // Send an empty object to get all rooms
            success: function (response) {
                // On success, populate the table with the returned data
                populateTable(response);
            },
            error: function (xhr, status, error) {
                console.error('Error loading room list:', error);
            }
        });
    }

    // Function to populate the table with data from the backend
    function populateTable(data) {
        var table = $('#inputTable tbody');
        table.empty(); // Clear any previous results

        // Ensure the response is parsed correctly
        if (Array.isArray(data)) {
            // Iterate over the returned data and add rows to the table
            data.forEach(function (item) {
                var row = '<tr>';
                row += '<td class="text-center">'+ item.index+'</td>'; // Empty column for actions (like buttons, etc.)
                row += '<td class="text-center">' +
                   '<a href="frmRooms.jsp?roomid=' + item.roomid + '" class="btn btn-primary btn-sm">Edit</a>' + 
                   '</td>'; // Empty column for actions (like buttons, etc.)
                row += '<td class="text-center">' + item.room_no + '</td>';
                row += '<td class="text-center">' + item.room_type + '</td>';
                row += '<td class="text-center">' + item.price_per_day + '</td>';
                row += '<td class="text-center">' + item.room_dscrpt + '</td>';
                row += '<td class="text-center">' + item.created_on + '</td>';
                row += '<td class="text-center">' + item.created_by + '</td>';
                row += '</tr>';
                table.append(row);
            });
        }
    }
});
