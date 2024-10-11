$('document').ready(function () {
    $("#btnRegister").on('click', function () {
        validateRegUser();
    });
    $("#txtPassword").on('keyup', function () {
        if ($("#txtPassword").val().length < 8) {
            $("#lblPasswordMsg").removeClass("d-none");
            $("#lblPasswordMsg").addClass("text-danger");
            $("#lblPasswordMsg").html("Password should be atleast of 8 characters");
            return false;
        }else{
            $("#lblPasswordMsg").addClass("d-none");
        }
    });
});
function validateRegUser() {
    if ($("#txtFullName").val() === '') {
        alert("Enter Name");
        return false;
    }
    if ($("#txtEmail").val() === '') {
        alert("Enter Email");
        return false;
    }
    if ($("#txtUserNm").val() === '') {
        alert("Enter UserName");
        return false;
    }
    if ($("#txtPassword").val() === '') {
        alert("Enter Password");
        return false;
    }
    if ($("#txtCnfPassword").val() === '') {
        alert("Enter Confirm Password");
        return false;
    }

    if ($("#txtCnfPassword").val() !== $("#txtPassword").val()) {
        alert("Confirm Password didn't matched");
        return false;
    }


    if (confirm("Are You Sure Want to Save?")) {
        $("#frmRegCrdt").submit();
    }


}
