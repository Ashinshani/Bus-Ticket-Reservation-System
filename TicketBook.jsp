<%@page import="java.sql.SQLException"%>
<%@page import="model.Buses"%>
<%@page import="java.util.List"%>
<%@page import="service.BusService"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Users"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Bus Ticket Reservation</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
        crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/index-styles.css" rel="stylesheet" />
    <style>
        .page-section {
            background-color: #91dcdf;
        }
    </style>
</head>
<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
	    <div class="container">
	        <a class="navbar-brand" href="#page-top">Bus Ticket Reservation</a>
	        <button class="navbar-toggler text-uppercase font-weight-bold bg-secondary text-white rounded" type="button" data-bs-toggle="collapse"
	            data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	            Menu <i class="fas fa-bars"></i>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	            <ul class="navbar-nav ms-auto">
	                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Home</a></li>
	                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
	                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Book Tickets</a></li>
	                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="">Bus Details</a></li>
	                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#route">Route Details</a></li>
	                <% Integer user = (Integer) session.getAttribute("UserId");
	                   if (user != null) {
	                %>
	                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="Logout.jsp">Logout</a></li>
	                <% Integer userLvl = (Integer) session.getAttribute("UserLevel");
	                   if(userLvl == 1) {
	                %>
	                <li class="nav-item mx-0 mx-lg-1 bg-danger"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="Admin.jsp">Profile</a></li>
	                <% } else if (userLvl == 2) { %>
	                <li class="nav-item mx-0 mx-lg-1 bg-danger"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="Profile.jsp">Profile</a></li>
	                <% } else { %>
	                <li class="nav-item mx-0 mx-lg-1 bg-danger"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="Driver-Admin.jsp">Profile</a></li>
	                <% } } else { %>
	                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="Login.jsp">Login</a></li>
	                <% } %>
	            </ul>
	        </div>
	    </div>
	</nav>

    <!-- Masthead-->
    <header class="masthead bg-secondary text-white">
        <div class="container">
            <h2 class="my-4">Bus Seat Booking</h2>
            <%
                // Fetch bus details using the busId passed in the query parameters
                String busId = request.getParameter("busId");
                if (busId != null) {
                    int id = Integer.parseInt(busId);
                    BusService busService = new BusService();
                    List<Buses> busesList = null;

                    try {
                        busesList = busService.getRouteDetailsById(id); // Method returns a list
                    } catch (SQLException | ClassNotFoundException e) {
                        e.printStackTrace();
                    }

                    if (busesList != null && !busesList.isEmpty()) {
                        // Assuming you are working with only one bus for a given ID
                        Buses bus = busesList.get(0); // Get the first bus from the list
            %>
            <h5>Booking for Bus: <%= bus.getBusNumber() %></h5>
            <h6>Route: <%= bus.getDestination() %></h6>
            <h6>Start Time: <%= bus.getStart_time() %></h6>
            <h6>Arrival Time: <%= bus.getArrival_time() %></h6>

            <!-- Price Section -->
            <div class="d-flex justify-content-end mb-4">
                <h5>Price: Rs. 500.00</h5> <!-- Display the price here -->
            </div>

            <!-- Booking Form -->
            <form action="processBooking.jsp" method="post" class="my-4">
                <!-- Hidden field to pass the BusID -->
                <input type="hidden" name="busId" value="<%= busId %>" />

                <!-- Passenger Name -->
                <div class="form-group">
                    <label for="passengerName">Passenger Name</label>
                    <input type="text" class="form-control" id="passengerName" name="passengerName" required>
                </div>
                <br>

                <!-- Booking Date -->
                <div class="form-group">
                    <label for="bookingDate">Booking Date</label>
                    <input type="date" class="form-control" id="bookingDate" name="bookingDate" required>
                </div>
                <br>

                <!-- Seat Number -->
                <div class="form-group">
                    <label for="seatNumber">Seat Number</label>
                    <input type="number" class="form-control" id="seatNumber" name="seatNumber" min="1" required>
                </div>
                <br>
                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary">Confirm Booking</button>
            </form>

            <% 
                    } else {
                        out.println("<h6>No bus found for ID: " + busId + "</h6>");
                    }
                } else {
                    out.println("<h6>No bus ID provided.</h6>");
                }
            %>
        </div>
    </header>
    <!-- Footer-->
    <footer class="footer text-center">
        <div class="container">
            <div class="row">
                <!-- Footer Location-->
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <h4 class="text-uppercase mb-4">Location</h4>
                    <p class="lead mb-0">
                        2215 John Daniel Drive <br /> Clark, MO 65243
                    </p>
                </div>
                <!-- Footer Social Icons-->
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <h4 class="text-uppercase mb-4">Around the Web</h4>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
                </div>
                <!-- Footer About Text-->
                <div class="col-lg-4">
                    <h4 class="text-uppercase mb-4">About Bus Reservation</h4>
                    <p class="lead mb-0">
                        Freelance is a free to use, MIT licensed Bootstrap theme created
                        by <a href="http://startbootstrap.com">Start Bootstrap</a>.
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>
