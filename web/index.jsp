<%@page import="com.MySqlConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    public String isBlankNull(String str) {
        return (str == null || str.trim().isEmpty()) ? "" : str;
    }
%>
<%
    String strUserId = String.valueOf(session.getAttribute("UserId"));
    if ("".equals(isBlankNull(strUserId)) || "null".equalsIgnoreCase(strUserId)) {
        response.sendRedirect("login.jsp");
        session.removeAttribute("UserId");
    } else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="style/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="style/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/JQuery.js" type="text/javascript"></script>
        <jsp:include page="include/menu.jsp"/>
    </head>
    <body class="bg-success">
        <!-- Main Content with Bootstrap Card -->
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card bg-light text-dark">
                        <div class="card-header text-center">
                            <h2>Welcome to Apex Hotels</h2>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Enjoy Your Stay</h5>
                            <p class="card-text">
                                At Apex Hotels, we strive to provide the best possible service to our guests. From luxurious rooms to world-class dining, 
                                everything is crafted to make your experience unforgettable. Explore our exclusive services such as Room Service, Dining, and Spa & Wellness.
                            </p>
                            <a href="#" class="btn btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-light text-dark">
                        <div class="card-header text-center">
                            <h2>Welcome to Apex Hotels</h2>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Enjoy Your Stay</h5>
                            <p class="card-text">
                                At Apex Hotels, we strive to provide the best possible service to our guests. From luxurious rooms to world-class dining, 
                                everything is crafted to make your experience unforgettable. Explore our exclusive services such as Room Service, Dining, and Spa & Wellness.
                            </p>
                            <a href="#" class="btn btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>


    </body>
</html>
<%    }%>
