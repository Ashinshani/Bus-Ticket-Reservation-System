<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>

   <input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="POST" action="UserRegistation" class="register-form"
							id="register-form">
							
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" required/>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" required/>
							</div>
							
						
							<div class="form-group">
								<label for="UserName"><i class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username" placeholder="Username" required/>
							</div>
							
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" required/>
							</div>
							
						
							<div class="form-group">
								<label for="address"><i class="zmdi zmdi-pin"></i></label> <input
									type="text" name="address" id="address" placeholder="Address" required/>
							</div>
							
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" required/>
							</div>
							
							<div class="form-group">
								<select class="select-box" id="user-roll" name="user-roll" required>
							        <option value="" disabled selected>--Please choose your roll--</option>
							        <option value="2">Customer</option>
							        <option value="3">Driver</option>
							    </select>
							</div>
							
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div><br>
						</form>
						
						<!-- Display error messages -->
					    <c:if test="${not empty errorMessage}">
					        <div style="color: red;">${errorMessage}</div>
					    </c:if>
					    
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/bus6.jpg" alt="sing up image" height="600px">
						</figure>
						<a href="Login.jsp" class="bus6.jpg-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	
	<script type="text/javascript">
	
	        var status= document.getElementById("status").value;
	        if(status== "success"){
	        	swal("Congrats","Account created successfully","success");
	        }
	</script>

</body>

</html>