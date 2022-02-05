<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<HTML>
       <HEAD>
       <link rel="stylesheet" href="table.css">
       <TITLE>City Chart</TITLE>
       </HEAD>
       <section>
       <H1>City Chart </H1>
       <%
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/covid19","classRoomUser","classRoomPass");
           Statement statement = connection.createStatement() ;
          ResultSet resultset = statement.executeQuery("select * from city_cases") ;
       %>
       <align="center">
      <!-- TABLE class="center" BORDER="1" width="500" align="center"-->
      <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
      <TR>
      <TH>City Code</TH>
      <TH>Total Cases</TH>
      <TH>Live Cases</TH>
      <TH>Death Cases</TH>
      <TH>Vaccinated Cases</TH>
      
      </TR>
      </thead>
    </table>
  </div>
      <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
      <% while(resultset.next()){ %>
      <TR>
       <TD> <%= resultset.getString(1) %></td>
       <TD> <%= resultset.getString(2) %></TD>
       <TD> <%= resultset.getString(3) %></TD>
       <TD> <%= resultset.getString(4) %></TD>
       <TD> <%= resultset.getString(5) %></TD>
      
      </TR>
      <% }connection.close(); %>
      </tbody>
    </table>
  </div>
     
     </align>
     </section>
</HTML>
