<jsp:useBean id="obj" class="com.UserRegistration"/>
<jsp:setProperty property="*" name="obj"/>
<%
    if (obj.UserRegistration() == null) {
        response.sendRedirect("login.jsp");
    } else {
        out.println(obj.UserRegistration());
    }
%>
