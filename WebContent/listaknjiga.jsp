<jsp:useBean  id="kupac"  scope="session" class="opk.Kupac"/>
<%@ page import="java.sql.*"%>

<style>
	h4 {width: 80%; margin: 1.2px; margin-right: auto; margin-left: auto;
     	color: beige; font: 700 14pt Calibri, Arial, Helvetica, Verdana; background-color:blue; 
     	letter-spacing: 4pt; text-align: left; text-shadow: 1.2px 1.2px black;}
	table {cellpadding:4; cellspacing:4; border:0; margin-right:auto; margin-left:auto;}          
    td {font:10pt Calibri, Arial, Helvetica, Verdana; text-align: center;}
    a { font:10pt 10pt Calibri, Arial, Helvetica, Verdana; color:navy; text-decoration: none;}
 </style>
 <head>
<link rel="SHORTCUT ICON" type="image/png" href="favicon.png"/>
<title>Katalog</title>
</head>
<body bgcolor="#e8e8e8">

<h4>&nbsp;Katalog</h4>

<table border=1 width=80% >
<tr style=" background-color:blue; letter-spacing: 4pt; text-align:center; text-shadow: 1.2px 1.2px black; color:beige">
<th>&nbsp;
<th>R.Br.
<th>ISBN 13
<th>Naslov
<th>Autor
<th>Cijena
<th>Kategorija
<th>Izdavač
<th>&nbsp;</tr>
<%
   
  String cond = (String) request.getAttribute("cond");
  if ( cond == null)
     cond = "1 = 1";
 
  Connection  con  = kupac.connectToDB();
  Statement st= con.createStatement();

  ResultSet rs = st.executeQuery("select rb, isbn13, naslov, autor, cijena, kategorija, izdavac from knjige where " + cond + " order by rb");

  while (rs.next())
  {

%>
<tr>
<td>
<a href=addbook.jsp?isbn13=<%=rs.getString("isbn13")%>>Dodaj u korpu!</a>
<td><%=rs.getInt(1)%>
<td><%=rs.getString(2)%>
<td><%=rs.getString(3)%>
<td><%=rs.getString(4)%>
<td><%=rs.getString(5)%>
<td><%=rs.getString(6)%>
<td><%=rs.getString(7)%>
<td>
<a href=detalji.jsp?isbn13=<%=rs.getString("isbn13")%>>Detalji o knjizi!</a>
</tr>
<%
  }
  rs.close();
  st.close();
  con.close();
%>
</table>
</body>