<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Patient</title>

  <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Arimo' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Hind:300' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="../static/css/style.css">

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarToggler">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="LoginSuccess.jsp">Home</a>
            </li>                 

          </ul>
        </div>
    </nav> 
 <div class="login">
 
  <div class="container">
  <h1>Update Patient Details</h1>
      <form action="updatePatient" method="post">
      <div class="form-row">
      <div class="col-md-4 mb-4">
                  <label for="validationServerUsername33">Patient ID</label>
                  
                      <input type="int" class="form-control is-valid" id="USER_ID" name="USER_ID" placeholder="Pid"
                      aria-describedby="inputGroupPrepend33" required>
                      <div class="invalid-feedback">
                      Please enter a valid Patient id.
                      </div>
                  </div>
      </div>
          <div class="form-row">
              <div class="col-md-4 mb-4">
                  <label for="validationServer013">Full name</label>
                  <input type="text" class="form-control is-valid" id="Name" name="Name" placeholder="Full name" required>
              </div>  
              </div>
          

      <div class="form-row">
          <div class="col-md-4 mb-3">
              <label for="validationServer033">City</label>
              <input type="text" class="form-control is-valid" id="CityCode" name="CityCode" placeholder="city1,city2,city3,city4" required>
              <div class="invalid-feedback">
                  Please provide a valid city.
              </div>
          </div>
          
          </div>
          <div class="form-row">
              <div class="col-md-4 mb-4">
                  <label for="validationServer013">Password</label>
                  <input type="text" class="form-control is-valid" id="PSWD" name="PSWD" placeholder="First name" required>
              </div>  
              </div>
              <div class="form-row">
              <div class="col-md-3 mb-3">
              <label for="validationServer043">Age</label>
              <input type="text" class="form-control is-valid" name="Age" id="Age" placeholder="Age" required>
              <div class="valid-feedback">
                  Please provide valid Age.
              </div>
          </div></div>
          <button class="btn btn-primary" type="submit">Submit form</button>
              
          </form>
      
    
      
      
		
      </div>
      
         
         
      </div>

      

      
      
  


</body>
</html>


