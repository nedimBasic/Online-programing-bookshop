<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "errorPage.jsp" %>
<html><meta lang="bs" http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'>
	 .header { background-color:#e8e8e8 }
	div {  width: 50%; margin-right: auto; margin-left: auto; 
            color: beige; font: 700 11pt Calibri, Arial, Helvetica, Verdana; background-color:blue; 
            letter-spacing: 15pt; text-align: center; text-shadow: 1.2px 1.2px black;}
	a:link {color:lightblue; font-size:11pt; text-align:justify; font-family:Calibri, Arial, Helvetica, Verdana; 
	        font-weight:700; text-shadow: 1.2px 1.2px white;}, a:visited, a:active {color:blue}
</style> 
    <head>
         <meta htttp-equiv="KEYWORDS" content="Knjiga, Knjižara, Online Knjiga, Knjižara modernog duha, Kućna dostava knjiga, Online plaćanje, 
         Programerske knjige, Java, Java Servlet Page, direktiva useBean, C++">
       <!-- Dodavanje favicon slike ispred naslova web stranice na kompjuterskom web pretraživaču -->
        <link rel="SHORTCUT ICON" type="image/png" href="favicon.png"/>
        <title>Registracija kupca</title>
    </head>
<body bgcolor="#e8e8e8">

<center>

<jsp:useBean id="kupac" class="opk.Kupac" scope="session" />

<jsp:setProperty  name="kupac" property="*" />

<%
 String result = kupac.registujKupca();

 if ( result == null) 
     response.sendRedirect("pocetna.jsp"); 
 else
     out.println("<div style='text-align:center; letter-spacing: 4pt;'>&nbsp;Žao nam je! Registracija nije uspjela, došlo je do greške:<p>" + result + 
     "<hr></br></div><a href=registracija.html>Pokušajte ponovo!</a><hr>");

%>
</center>
</body>
</html>