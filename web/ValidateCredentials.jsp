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
    ResultSet rst = null;
    String strUserName = isBlankNull(request.getParameter("txtUserNm"));
    String strPassword = isBlankNull(request.getParameter("txtPassword"));
    try {
        con = dbc.getConnection();
        pstmt = con.prepareStatement("select UserId from userdetails where BINARY UserName = '" + strUserName + "' and BINARY Password = '" + strPassword + "'");
//        System.out.println("select UserId from userdetails where BINARY UserName = '" + strUserName + "' and BINARY Password = '" + strPassword + "'");
        rst = pstmt.executeQuery();
        if (rst.next()) {
            session.setAttribute("UserId", "" + rst.getString("UserId") + "");
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    } catch (Exception ex) {
        out.println("Error in ValidateCredentials.jsp >> " + ex.getMessage());
    }
%>
