<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="kupac"  scope="session"  class="opk.Kupac"/>

<jsp:setProperty name="kupac" property="*" />

<%
   if (!kupac.isLogged())
      response.sendRedirect("prijava.html");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><meta lang="bs" http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'>
	 h2 {width: 50%; margin: 1.2px; margin-right: auto; margin-left: auto; margin-bottom:10px;
     color: beige; font: 700 20pt Calibri, Arial, Helvetica, Verdana; background-color:blue; 
     letter-spacing: 10pt; text-align: center; text-shadow: 1.2px 1.2px black;}
     h4 {width: 50%; margin: 1.2px; margin-right: auto; margin-left: auto;
     color: beige; font: 700 Calibri, Arial, Helvetica, Verdana; background-color:blue; 
     letter-spacing: 4pt; text-align: left; text-shadow: 1.2px 1.2px black;}
     table {width:50%; cellpadding:4; cellspacing:4; border:0; margin-right:auto; margin-left:auto;}          
     td {font:12pt Calibri, Arial, Helvetica, Verdana;}
      a { font:12pt 10pt Calibri, Arial, Helvetica, Verdana; color:navy; text-decoration: none;}
     
     #dugme{align-items: flex-start;
    text-align: center;
    cursor: default;
    color: buttontext;
    background-color: buttonface;
    margin: auto auto auto auto;
    background: white;
    padding: 2px 6px 3px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;}
</style> 
    <head>
         <meta htttp-equiv="KEYWORDS" content="Knjiga, Knjižara, Online Knjiga, Knjižara modernog duha, Kućna dostava knjiga, Online plaćanje, 
         Programerske knjige, Java, Java Servlet Page, direktiva useBean, C++">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <!-- Dodavanje favicon slike ispred naslova web stranice na kompjuterskom web pretraživaču -->
        <link rel="SHORTCUT ICON" type="image/png" href="favicon.png"/>
        <title>Promomjena informacija o računu</title>
     </head>
     
<body bgcolor="#e8e8e8">

<h2>Promjena informacija o računu</h2>
<form action="promijeniprofil.jsp" method="post">
<h4>&nbsp;Lične informacije</h4>
<table>
<tr>
<td>
Email Adresa
<td>
<input type=text name=email size=30 value=<%=kupac.getEmail()%>>
</tr>

<tr>
<td>Poštanska Adresa
<td>
<textarea name="adresa" rows=3 cols=30><%=kupac.getAdresa()%></textarea>
</td>
</tr>

<tr>
<td>
Telefonski broj
<td>
<input type=text  name=telefon  size=30 value='<%=kupac.getTelefon()%>'>
</tr>
</table>

<h4>&nbsp;Promjena lozinke</h4>

<table>
<tr>
<td>
Nova lozinka
<td>
<input type=password name=lozinka size=20>
</tr>
<tr>
<td>
Potvrdi lozinku
<td>
<input type=password name=lozinka2 size=20>
</tr>
</table>
<hr></hr>
<p>
<div style="width: 50%; text-align:right; margin-right: auto; margin-left: auto;">
<input type=submit id="dugme" value="Promijeni!">
<input type=reset id="dugme" value="Obriši lozinku!"> 
</div>
<p style="width: 50%; margin: 1.2px; margin-right: auto; margin-left: auto;">
<a href="pocetna.jsp">« Početna</a>
</form>


<%

  // do it if any invoked by itself
  if ( request.getParameter("email") == null)
    return;

  String res = kupac.promijeniProfil(request.getParameter("lozinka"));
    
  if ( res == null)
      out.println("</br><h4>&nbsp;Nove postavke o računu su uspješno promjenjene.</h4>");
  else
      out.println("</br><h4>&nbsp;Došlo je do greške : </h4><h4>&nbsp;" + res +"</h4></br>");
 
  out.println("<h4>&nbsp;Klikni <a href=pocetna.jsp>ovdje</a> za nastavak narudžbe...</h4>");  

%>
</body>
</html>   