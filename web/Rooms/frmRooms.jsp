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
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="../style/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../style/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/JQuery.js" type="text/javascript"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
        <script src="../js/OnlyNumbers.js" type="text/javascript"></script>
        <script src="../js/RoomDtls.js" type="text/javascript"></script>
        <jsp:include page="../include/menu.jsp"/>
    </head>
    <body class="bg-success">
        <!-- Main Content with Bootstrap Card -->
        <div class="container mt-5">
            <form id="frmRoomsDtls" action="insertRoomDtls.jsp" method="POST">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card bg-light text-dark">
                            <div class="card-header text-center">
                                <h2>Insert Rooms Details</h2>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-2">
                                        <label for="txtRoomNo">Room No: </label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text" id="txtRoomNo" name="txtRoomNo" class="form-control form-control-sm" placeholder="Enter Room No" onkeydown="allowOnlyNumbers(event)"/>
                                    </div>
                                    <div class="col-2">
                                        <label for="slcRoomType">Room Type: </label>
                                    </div>
                                    <div class="col-4">
                                        <%
                                            MySqlConnection dbc = new MySqlConnection();
                                            Connection con = null;
                                            PreparedStatement pstmt = null;
                                            ResultSet rst = null;
                                            try {
                                                dbc = new MySqlConnection();
                                                con = dbc.getConnection();
                                                pstmt = con.prepareStatement("Select * from roomstypesdetails", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                                                rst = pstmt.executeQuery();
                                        %>
                                        <select id="slcRoomType" name="slcRoomType" class="form-control-sm form-select select2" onchange="setRoomPrice()">
                                            <option value="">Select Room Type</option> <!-- Default option -->
                                            <%
                                                while (rst.next()) {
                                            %>
                                            <option value="<%= rst.getString("type_id")%>" data-price="<%= rst.getString("type_price")%>" >
                                                <%= rst.getString("type")%> : <%= rst.getString("type_price")%>
                                            </option>
                                            <% } %>
                                        </select>
                                        <%
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                                out.println("Error while loading room type");
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2">
                                        <label for="txtRoomPrice">Room Price: </label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text" id="txtRoomPrice" name="txtRoomPrice" class="form-control form-control-sm" placeholder="Enter Room No" onkeydown="allowOnlyNumbersAndDecimal(event)"/>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2">
                                        <label for="txtRoomNo">Room Description: </label>
                                    </div>
                                    <div class="col-10">
                                        <textarea class="form-control" id="txtRoomdscrpt" name="txtRoomdscrpt" rows="4" placeholder="Enter Description"></textarea>
                                    </div>

                                </div>
                                <div class="row mt-2"></div>
                                <div class="row d-flex justify-content-center mt-3" style="height:50px;">
                                    <div class="col-12 col-md-2">
                                        <button type="submit" class="btn btn-success w-50">Submit</button>
                                        <input type="text" id="txtUserId" class="d-none" name="txtUserId" value="<%= strUserId%>"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>


    </body>
</html>
<% }%>
