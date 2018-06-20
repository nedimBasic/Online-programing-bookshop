<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="kupac" class="opk.Kupac" scope="session" />
 <jsp:setProperty name="kupac" property="*" /> 
 <html><meta lang="bs" http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <style type='text/css'>
	 .header { background-color:#e8e8e8 }
	div {  width: 80%; margin-right: auto; margin-left: auto; 
            color: beige; font: 700 30pt Calibri, Arial, Helvetica, Verdana; background-color:blue; 
            letter-spacing: 15pt; text-align: center; text-shadow: 1.2px 1.2px black;}
   tr {  width: 50%; margin-right: auto; margin-left: auto; 
            color: beige; font: 700 10pt Calibri, Arial, Helvetica, Verdana; background-color:blue; 
            letter-spacing: 2pt; text-align: center; text-shadow: 1.2px 1.2px black;}
	h1 {color:beige; font-size:30pt; text-align:center; font-family:Calibri, Arial, Helvetica, Verdana; font-weight:bold; letter-spacing:15pt;}
	 .menu {color:#343434; font-size:12pt; text-align:center; font-family:Calibri, Arial, Helvetica, Verdana; font-weight:bold} 
	p {color:#343434; font-size:12pt; text-align:justify; font-family:Calibri, Arial, Helvetica, Verdana; font-weight:bold}
	a:link {color:lightblue; font-size:11pt; text-align:justify; font-family:Calibri, Arial, Helvetica, Verdana; 
	        font-weight:700; text-shadow: 1.2px 1.2px white;}, a:visited, a:active {color:blue}
	#dugme{align-items: flex-start;
    text-align: center;
    cursor: default;
    color: buttontext;
    background-color: blue;
    margin: auto auto auto auto;
    background: orange;
    padding: 2px 6px 3px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;}
</style> 
<head>
      <meta htttp-equiv="KEYWORDS" content="Knjiga, Knjižara, Online Knjiga, Knjižara modernog duha, Kućna dostava knjiga, Online plaćanje, 
         Programerske knjige, Java, Java Servlet Page, direktiva useBean, C++">
<!-- Dodavanje favicon slike ispred naslova web stranice na kompjuterskom web pretraživaču -->
<link rel="SHORTCUT ICON" type="image/png" href="favicon.png"/>
<title>Početna</title>
</head>
<body bgcolor="#e8e8e8">

<!-- Sadrzaj stranice za prijavu/Content page -->
<table width="80%" cellpadding="4" cellspacing="4" border="1" style="margin-right:auto; margin-left:auto; margin-top:10px;">
<tr>
<div style="font-size:11pt; text-align:left; letter-spacing: 4pt;">&nbsp;Dobrodošli <b><%= kupac.getImek() + " " + kupac.getPrezimek() %></b></div>
</tr>
<tr>
<td>
<h1>Potrošačka korpa </h1>
<table  width=100%>
<tr>
<td width=70%>
<table  width=100%>
<tr>
<td width=70%>

<form action="pocetna.jsp" method="get">
<table border=1 style="background-color:lightblue" width="100%">  
<tr>
<th>Naslov knjige
<th>Cijena
<th>Količina
<th>Ukupno
<th>&nbsp;
</tr>
<tr>
<td>
<input type=hidden value='ISBN-13:978-0071809252' name=isbn>
Java: A Beginner's Guide
<td align="right"> 14.75 BAM
<td align="center"><input type=text name=qty  size=5 value='1 kom'>
<td align="right"> 14.75 BAM
<td align="center"><a href=pocetna.jsp?act=ukloni&isbn=ISBN-13:978-0071809252>Ukloni</a>
</tr>

<%-- <%
 }
%> --%>
<tr>
<td colspan=5 style="text-align:center;font:700 12pt verdana;color:lightgreen">
Ukupna Suma  :  14.75 BAM <!-- -->
</tr>
</table>
<td>
<p>
&nbsp;&nbsp;<input type=submit id="dugme" value="Dodaj u korpu!"  name="act">
<p>
&nbsp;&nbsp;<input type=submit id="dugme" value="Isprazni korpu!"  name="act">
<p>
&nbsp;&nbsp;<input type=submit id="dugme" value="Završi narudžbu!"  name="act">

</tr>
</table>
</td>
</tr>

<tr>
<td>
[<a href="promijeniprofil.jsp">Promijeni podatke o svom računu!</a>] &nbsp;&nbsp;
[<a href="prikaziknjige.jsp">Prikaži sve knjige!</a>] &nbsp;&nbsp;
[<a href="nadjiknjige.jsp">Nađi knjige!</a>] &nbsp;&nbsp;
[<a href="historijanarudzbi.jsp">Historija narudžbi!</a>] &nbsp;&nbsp;
[<a href="odjava.jsp"> Odjavi se! </a>]
</td>
</tr>
</table>

</body>
</html>
