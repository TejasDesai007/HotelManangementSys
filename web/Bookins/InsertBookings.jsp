<jsp:useBean id="obj" class="com.Bookings"/>
<jsp:setProperty property="*" name="obj"/>
<%
    if (obj.Bookings() == null) {
//        response.sendRedirect("RoomsList");
        out.println("successFull");
    } else {
        out.println(obj.Bookings());
    }
%>
