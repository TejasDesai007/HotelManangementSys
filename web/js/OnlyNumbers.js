function allowOnlyNumbers(event) {

    if ($.inArray(event.keyCode, [8, 46, 9, 27, 13]) !== -1 ||
            (event.keyCode >= 48 && event.keyCode <= 57) ||
            (event.keyCode >= 96 && event.keyCode <= 105)) {
        return;
    } else {
        event.preventDefault();
    }
}

function allowOnlyNumbersAndDecimal(event) {
    const keyCode = event.keyCode || event.which;
    const inputValue = event.target.value; // Get the current value of the input field
    if (
            keyCode === 8 || keyCode === 46 || keyCode === 9 || keyCode === 27 || keyCode === 13 || // allowed control keys
            (keyCode >= 48 && keyCode <= 57) || // numbers 0-9 on the top row
            (keyCode >= 96 && keyCode <= 105) || 
            keyCode === 109 || keyCode === 189 
            ) {
        return; 
    }

    
    if (keyCode === 190 && inputValue.indexOf('.') !== -1) {
        event.preventDefault(); // Block the second dot
    } else if (keyCode === 190) {
        return; // Allow the first dot
    } else {
        event.preventDefault(); // Block any other characters
    }
}


