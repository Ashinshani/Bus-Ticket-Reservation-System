<%@page import="java.sql.SQLException"%>
<%@page import="model.Route"%>
<%@page import="java.util.List"%>
<%@page import="service.RouteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Bus Reservation Admin Dashboard</title>
    <link rel="stylesheet" href="css/Dashboard.css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet"  href="https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@300;400;500;600&display=swap">
</head>
<body>
   <input type="checkbox" id="menu-toggle">
    <div class="sidebar">
        <div class="side-header">
            <span class="las la-bus"></span><h2> Bus Reservation</h2>
        </div>
        
        <div class="side-content">
            <div class="profile">
                <div class="profile-img bg-img" style="background-image: url(img/3.jpeg)"></div>
                <% 
                	  String username = (String) session.getAttribute("UserName");
                	  out.print("<h4>"+username+"</h4>");
				%>
                <small>Admin</small>
            </div>

            <div class="side-menu">
                <ul>
                    <li>
                       <a href="Admin.jsp">
                            <span class="las la-home"></span>
                            <small>Dashboard</small>
                        </a>
                    </li>
                    <li>
                       <a href="">
                            <span class="las la-user-alt"></span>
                            <small>Profile</small>
                        </a>
                    </li>
                    <li>
                       <a href="">
                            <span class="las la-envelope"></span>
                            <small>Mailbox</small>
                        </a>
                    </li>
                    <li>
                       <a href="">
                            <span class="las la-clipboard-list"></span>
                            <small>Bus Tickets</small>
                        </a>
                    </li>
                    <li>
                       <a href="Bus-Admin.jsp">
                        <span class="las la-bus"></span>
                        <small>Bus Details</small>
                        </a>
                    </li>
                    <li>
                       <a href="Route-Admin.jsp" class="active">
                            <span class="las la-route"></span>
                            <small>Routes</small>
                        </a>
                    </li>

                    <li>
                        <a href="Driver-Admin.jsp">
                             <span class="las la-users"></span>
                             <small>Driver Details</small>
                         </a>
                     </li>

                </ul>
            </div>
        </div>
    </div>
    
    <div class="main-content">
        
        <header>
            <div class="header-content">
                <label for="menu-toggle">
                <span>Routes</span>
                </label>
                
                <div class="header-menu">
                                        
                    <div class="user">
                        <div class="bg-img" style="background-image: url(img/1.jpeg)"></div>
                        
                       <a href="Logout.jsp"><span class="las la-power-off"></span>
                        <span>Logout</span></a>
                    </div>
                </div>
            </div>
        </header>
        
        <div class="page-content">
               
                <div class="records table-responsive">
                    
                    <div class="add-route">
                <div class="row justify-content-left">
				<div class="col-lg-8 col-xl-7">
					<h4>Add New Route</h4>
					<br>
					
					<form id="contactForm" action="AddRouteAdmin" method="POST">
						<!-- Route Name input-->
						
						   <h6>
							<label for="name">Route Name</label>
						  </h6>
					        <input type="text" class="form-control" name="route_name" placeholder="Enter Route name" required>
					      <br>
					      
						<!-- Source address input-->
							<h6>
							  <label for="email">Source Address</label>
							 </h6>
							  <input type="text" class="form-control" name="source_address" placeholder="Enter Source Address" required>
						 <br>
						 
						 
						 <!-- First stop  -->
						 <h6>
							  <label for="email">First stop</label>
						</h6>
							  <input type="text" class="form-control" name="first_stop" placeholder="Enter First stop" required>
						 <br>
						
						 
						 <!-- Second stop -->
						  <h6>
							  <label for="email">Second stop</label>
						  </h6>
							  <input type="text" class="form-control" name="second_stop" placeholder="Enter second stop" required>
						 <br>
						 
						 
						 <!-- destination -->
						 <h6>
							  <label for="email">Destination</label>
						 </h6>
							  <input type="text" class="form-control" name="destination" placeholder="Enter destination" required>
						 <br>
						 
						 <!-- start time -->
						 <h6>
							  <label for="email">Start Time</label>
						</h6>
							  <input type="time" class="form-control" name="start_time" placeholder="Enter start time" required>
						 <br>
						 
						 <!-- Arrival Time -->
						 <h6>
							  <label for="email">Arrival Time</label>
						 </h6>
							  <input type="time" class="form-control" name="arrival_time" placeholder="Enter Arrival time" required>
						 <br>
						 
						<div class="form-group">
                       <button type="submit" class="btn btn-primary">ADD Route</button>
                       </div>
                       <!-- Display error messages -->
						<c:if test="${not empty errorMessage}"> 
							<div class="alert success">
							  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
							  ${errorMessage}
							</div>
						</c:if>
					</form>
				
				</div>          <!--table content-->
             </div>
             <hr>
             <br>        
             
             <div class="update-route">
               <div class="row justify-content-left">
                
				<div class="col-lg-8 col-xl-7">
				       <h4>Update Route</h4>
				       <br>
					   
					   <form action="UpdateRouteAdmin" method="POST">
				       
				       <div >
				       <h6>Route ID</h6>
				        <select class="form-control" name="routeSelect" id="routeSelect">
					        <option value="" disabled selected>Select a route</option>
					        <%
						        RouteService service = new RouteService();
								try {
									List<Route> routes = service.getRouteId();
									for(Route rt: routes){
										out.print("<option value="+rt.getRoute_id()+">"+rt.getRoute_id()+"</option>");
									}
									
	
								}catch (SQLException | ClassNotFoundException e) {
						            e.printStackTrace();
						        }
								%>
					    </select>
				       </div>
				       <br>
				       
				       <div>
				       <h6>Route Name</h6>  <input type="text" class="form-control" name="route_name" id="route_name" required>
				       </div>
				       <br>
				       
				       <div>
				       <h6>Source Address</h6>  <input type="text" class="form-control" name="source_address" id="source_address" required>
				       </div>
				       <br>
				       
				       <div>
				       <h6>First stop</h6>  <input type="text" class="form-control" name="first_stop" id="first_stop" required>
				       </div>
				       <br>
				       
				       <div >
				       <h6>Second stop</h6>  <input type="text" class="form-control" name="second_stop" id="second_stop" required>
				       </div>
				       <br>
				       
				       <div >
				       <h6>Destination</h6>  <input type="text" class="form-control" name="destination" id="destination" required>
				       </div>
				       <br>
				       
				       <div >
				       <h6>Start Time</h6>  <input type="time" class="form-control" name="start_time" id="start_time" required>
				       </div>
				       <br>
				       
				       <div >
				       <h6>Arrival Time</h6>  <input type="time" class="form-control" name="arrival_time" id="arrival_time" required>
				       </div>
				       <br>
				       
				       <div class="form-group">
				   				       
                       <button type="submit" class="btn btn-primary">Update</button>
                       </div>
				       <!-- Display error messages -->
						<c:if test="${not empty errorMessageUpdate}"> 
							<div class="alert success">
							  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
							  ${errorMessageUpdate}
							</div>
						</c:if>
				       </form>
				       
				       <hr>
				       
				       <h4>Cancel Route</h4>
				       <form action="DeleteRouteAdmin" method="POST">
				       <div class="form-group">
					        <label>Route Id</label>
					        <input type="text" name="route_id"/>
					        <button type="submit" class="btn btn-primary">Delete</button>
					       </div>
				       <!-- Display error messages -->
						<c:if test="${not empty errorMessageDelete}"> 
							<div class="alert success">
							  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
							  ${errorMessageDelete}
							</div>
						</c:if>
				       </form>
				
               </div>
             </div>
             </div>
            </div>
            
                </div>
            
            </div>      
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#routeSelect').change(function () {
            var routeId = $(this).val();
            if (routeId) {
                $.ajax({
                    url: 'UpdateRouteAdmin', // This is the URL for the servlet that handles the request
                    type: 'GET',
                    data: { route_id: routeId },
                    success: function (response) {
                        $('#route_name').val(response.route_name);
                        $('#source_address').val(response.source_address);
                        $('#first_stop').val(response.first_stop);
                        $('#second_stop').val(response.second_stop);
                        $('#destination').val(response.destination);
                        $('#start_time').val(response.start_time);
                        $('#arrival_time').val(response.arrival_time);
                    },
                    error: function (xhr, status, error) {
                        console.error("Error fetching route details:", error);
                    }
                });
            }
        });
    });
</script>
</body>
</html>