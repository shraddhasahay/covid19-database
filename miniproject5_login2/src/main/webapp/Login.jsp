<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- %@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%-->
<!-- %@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="login.css">
<link rel="stylesheet" type="text/css" href="slide navbar style.css">
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">

<title>Covid Database</title>
</head>
<body>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
				<form action="SignupServlet" method="post">
					<label for="chk" aria-hidden="true">Sign up</label>
					<input type="number" name="USER_ID" placeholder="User_ID" required>
					<input type="text" name="CityCode" placeholder="(city1,city2,city3,city4)" required>
					<input type="text" name="Name" placeholder=" Full Name" required>
					<input type="number" name="Age" placeholder="Age(number)" required>
					<input type="password" name="PSWD" placeholder="Password" required>
					<button>Sign up</button>
				</form>
			</div>

			<div class="login">
				<form action="login" method="post">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="number" name="USER_ID" placeholder="User_ID" required>
					<input type="password" name="PSWD" placeholder="Password" required>
					<button>Login</button>
				</form>
			</div>
	</div>
</body>
</html>


