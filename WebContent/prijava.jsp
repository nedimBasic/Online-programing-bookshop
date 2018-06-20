<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="kupac" class="opk.Kupac" scope="session" />
 <jsp:setProperty name="kupac" property="*" />  
<!DOCTYPE html>
<html><meta lang="bs" http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'>
	 .header { background-color:#e8e8e8 }
	div {  width: 50%; margin-right: auto; margin-left: auto; 
            color: beige; font: 700 30pt Calibri, Arial, Helvetica, Verdana; background-color:blue; 
            letter-spacing: 15pt; text-align: center; text-shadow: 1.2px 1.2px black;}
	h1 {color:beige; font-size:30pt; text-align:center; font-family:Calibri, Arial, Helvetica, Verdana; font-weight:bold; letter-spacing:15pt;}
	 .menu {color:#343434; font-size:11pt; text-align:center; font-family:Calibri, Arial, Helvetica, Verdana; font-weight:bold} 
	p {color:#343434; font-size:11pt; text-align:justify; font-family:Calibri, Arial, Helvetica, Verdana; font-weight:bold}
	a:link {color:lightblue; font-size:11pt; text-align:justify; font-family:Calibri, Arial, Helvetica, Verdana; 
	        font-weight:700; text-shadow: 1.2px 1.2px white;}, a:visited, a:active {color:blue}
</style> 
    <head>
        <meta htttp-equiv="KEYWORDS" content="Knjiga, Knjižara, Online Knjiga, Knjižara modernog duha, Kućna dostava knjiga, Online plaćanje, 
         Programerske knjige, Java, Java Servlet Page, direktiva useBean, C++">
       <!-- Dodavanje favicon slike ispred naslova web stranice na kompjuterskom web pretraživaču -->
        <link rel="SHORTCUT ICON" type="image/png" href="favicon.png"/>
        <title>Prijava kupca</title>
    </head>
    <body>
        <%
          //session.setMaxInactiveInterval(1800);  // 30 minute time out 
          kupac.login();
          if(kupac.isLogged())
            {// out.println("<div style='font-size:11pt; text-align:left; letter-spacing: 4pt;'>&nbsp;Zdravo "
                //         +kupac.getImek()+" "+kupac.getPrezimek()+"</div><br/>");
            response.sendRedirect("pocetna.jsp");
            }
          else
            out.println("<div style='text-align:left; letter-spacing: 4pt;'>&nbsp;Pogrešna prijava!</div><br />");
         out.println("<div style='font-size:11pt; text-align:left; letter-spacing: 4pt;'><a href='prijava.html'>&nbsp;Pokušajte ponovo!</a></div>");
        %>
    </body>
</html>
