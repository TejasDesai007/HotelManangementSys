<jsp:useBean id="obj" class="com.TypePrice"/>
<jsp:setProperty property="*" name="obj"/>
<%
    if (obj.TypePrice() == null) {
        response.sendRedirect("index.jsp");
//        out.println("successFull");
    } else {
        out.println(obj.TypePrice());
    }
%>
