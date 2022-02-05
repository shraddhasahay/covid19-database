<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import=" java.util.ArrayList"  %>

<%@page import="next.xadmin.login.bean.City_Cases"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
   
    <link rel="stylesheet" href="style.css">
    
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
   <title>Covid Database</title>
<body>
  <div class="sidebar">
    <div class="logo-details">
      <i class='bx bxl-c-plus-plus'></i>
      <span class="logo_name">CovidDatabase</span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="#" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="patient.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Patient</span>
          </a>
        </li>
        <li>
          <a href="treatment.jsp">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name" >Treatment</span>
          </a>
        </li>
        <li>
          <a href="vaccination.jsp">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">Vaccination</span>
          </a>
        </li>
        <li>
          <a href="death_logs.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Death_logs</span>
          </a>
        </li>
       
        <li class="log_out">
          <a href="Login.jsp">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
  </div>
  
  <section class="home-section" action="display" method="processRequest">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>
     
    </nav>

    <div class="home-content">
      <div class="overview-boxes">
       
        </div>
        <div class="box">
          <div class="right-side">
            
            <%@include file="/dis.jsp"%>
              
            </div>
          </div>
         
        </div>
      </div>
      <div class=container>
      
      
		</div>
      
  </section>
           
  <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
 </script>

</body>
</html>
