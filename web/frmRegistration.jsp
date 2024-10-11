<%!
    public String isBlankNull(String str) {
        return (str == null || str.trim().isEmpty()) ? "" : str;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="style/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <script src="js/JQuery.js" type="text/javascript"></script>
        <script src="js/RegistrationValidate.js?v=18032024202533" type="text/javascript"></script>
        <style>
            /* Center the card */
            .center-card {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;

            }
            .custom-width {
                width: 500px; /* Adjust the width as per your requirement */
            }
            body {
                background-image: url('Images/abstract-luxury-gradient-blue-background-smooth-dark-blue-with-black-vignette-studio-banner.jpg');
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body >
        <form id="frmRegCrdt" name="frmRegCrdt" method="POST" action="saveRegUser.jsp">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 offset-sm-2 center-card">
                        <div class="card custom-width">
                            <div class="card-body ">
                                <h5 class="card-title"><i class="fas fa-hotel"></i> Apex Hotels</h5>
                                Enter Your Details Here!
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label for="txtFullName">Full Name: </label>  <input type="textbox" id="txtFullName" class="form-control form-control-sm bg-white" name="txtFullName" autocomplete="off"/>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label for="txtEmail">Email: </label>  <input type="textbox" id="txtEmail" class="form-control form-control-sm bg-white" name="txtEmail" autocomplete="off"/>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label for="txtUserNm">User Name: </label>  <input type="textbox" id="txtUserNm" class="form-control form-control-sm bg-white" name="txtUserNm" autocomplete="off"/>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label for="txtPassword">Password: </label> <input type="password" id="txtPassword" class="form-control form-control-sm bg-white" name="txtPassword" autocomplete="off"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <small><label id="lblPasswordMsg" class="d-none"></label></small>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label for="txtCnfPassword">Confirm Password: </label> <input type="password" id="txtCnfPassword" class="form-control form-control-sm bg-white" name="txtCnfPassword" autocomplete="off"/>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-4">
                                        <button type="button" id="btnRegister" class="btn btn-success" name="btnRegister" >Proceed</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
