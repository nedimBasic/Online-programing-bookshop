<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="kupac" class="opk.Kupac" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Odjava kupca</title>
    </head>
    <body>
        <%
          kupac.logOut();
          session.invalidate();
          response.sendRedirect("prijava.html");
        %>
    </body>
</html>

