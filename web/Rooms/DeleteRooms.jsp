<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.MySqlConnection"%>
<%!
    public String isBlankNull(String str) {
        return (str == null || str.trim().isEmpty()) ? "" : str;
    }
%>
<%
    MySqlConnection dbc = new MySqlConnection();
    Connection con = null;
    PreparedStatement pstmt = null;
    String roomid = isBlankNull(request.getParameter("roomid"));

    try {
        con = dbc.getConnection();
        pstmt = con.prepareStatement("DELETE FROM rooms WHERE roomid = ?");
        pstmt.setString(1, roomid);

        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("Deleted Successfully!");
            
        } else {
            out.println("No record found with the given room ID.");
        }

    } catch (SQLException ex) {
        
        if (ex.getMessage().toLowerCase().contains("foreign key constraint fails")) {
            out.println("Cannot delete: The room is used in for bookings");
        } else {
            out.println("Error occurred: " + ex.getMessage());
        }
    } finally {
        
        try {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (Exception e) {
            out.println("Error closing resources: " + e.getMessage());
        }
    }
%>