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
    if ($("#txtFName").val() === '') {
        alert("Enter First Name");
        return false;
    }
    if ($("#txtLName").val() === '') {
        alert("Enter Last Name");
        return false;
    }
    if ($("#txtEmail").val() === '') {
        alert("Enter Email");
        return false;
    }
    if ($("#txtPhone").val() === '') {
        alert("Enter Phone");
        return false;
    }
    if ($("#txtEmpNo").val() === '') {
        alert("Enter Employee No.");
        return false;
    }
    if ($("#selUserType").val() === '0') {
        alert("Select User Type");
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
