<%@page import="model.Buses"%>
<%@page import="service.BusService"%>
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
                       <a href="Bus-Admin.jsp" class="active">
                        <span class="las la-bus"></span>
                        <small>Bus Details</small>
                        </a>
                    </li>
                    <li>
                       <a href="Route-Admin.jsp">
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
                <span>Bus</span>
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
					<h4>Add New Bus</h4>
					<br>
					
					<form id="contactForm" action="AddBusAdmin" method="POST">
						<!-- Bus number input-->
						
						   <h6>
							<label for="name">Bus Number</label>
						  </h6>
					        <input type="number" class="form-control" name="bus_number" placeholder="Enter Bus Number" required>
					      <br>
					      
						<!-- bustype input-->
							<h6>
							  <label for="email">Capacity</label>
							 </h6>
							  <input type="number" class="form-control" name="capacity" placeholder="Enter Capacity" required>
						 <br>
						 
						 
						 <!-- bus type stop  -->
						 <h6>
							  <label for="email">Select Bus Type</label>
						</h6>
							  <select id="busType" name="busType" class="form-control">
							        <option value="" disabled selected>Select Bus Type</option>
							        <option value="cityBus">City or Transit Bus</option>
							        <option value="intercityBus">Intercity or Coach Bus</option>
							        <option value="doubleDeckerBus">Double-Decker Bus</option>
							        <option value="minibus">Minibus</option>
							        <option value="schoolBus">School Bus</option>
							        <option value="articulatedBus">Articulated (Bendy) Bus</option>
							        <option value="electricBus">Electric Bus</option>
							        <option value="luxuryBus">Luxury or Sleeper Bus</option>
							        <option value="touristBus">Tourist or Sightseeing Bus</option>
							        <option value="shuttleBus">Shuttle Bus</option>
							        <option value="hybridBus">Hybrid Bus</option>
							        <option value="paratransitBus">Paratransit Bus</option>
							    </select>
						 <br>
						
						 
						 <!-- route stop -->
						  <h6>
							  <label for="email">Select Route</label>
						  </h6>
							  <select class="form-control" name="routeSelect" id="routeSelect">
					        <option value="" disabled selected>Select a route</option>
					        <%
						        RouteService service = new RouteService();
								try {
									List<Route> routes = service.getRouteName();
									for(Route rt: routes){
										out.print("<option value="+rt.getRoute_id()+">"+rt.getRoute_name()+"</option>");
									}
									
	
								}catch (SQLException | ClassNotFoundException e) {
						            e.printStackTrace();
						        }
								%>
					    </select>
					    <br>
						 
						<div class="form-group">
                       <button type="submit" class="btn btn-primary">ADD Bus</button>
                       </div>
                       <!-- Display error messages -->
						<c:if test="${not empty errorMessage}"> 
							<div class="alert success">
							  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
							  ${errorMessage}
							</div>
						</c:if>
					</form>
				
				</div>  
             </div>
             <hr>
             <br>        
             
             <div class="update-route">
               <div class="row justify-content-left">
                
				<div class="col-lg-8 col-xl-7">
				       <h4>Update Bus</h4>
				       <br>
					   
					   <form action="UpdateBusAdmin" method="POST">
				       
				       <div >
				       <h6>Bus Number</h6>
				        <select class="form-control" name="busSelect" id="busSelect">
					        <option value="" disabled selected>Select a bus</option>
					        <%
						        BusService busservice = new BusService();
								try {
									List<Buses> buses = busservice.getBusName();
									for(Buses rt: buses){
										out.print("<option value="+rt.getBusID()+">"+rt.getBusNumber()+"</option>");
									}
									
	
								}catch (SQLException | ClassNotFoundException e) {
						            e.printStackTrace();
						        }
								%>
					    </select>
				       </div>
				       <br>
				       
				       <div>
				       <h6>Capacity</h6>  <input type="number" class="form-control" name="bus_capacity" id="bus_capacity" required>
				       </div>
				       <br>
				       
				       <div>
				       <h6>Bus Type</h6>  <input type="text" class="form-control" name="bus_type_display" id="bus_type_display" disabled>
				       <br>
				       <select id="busTypeUp" name="busTypeUp" class="form-control">
							        <option value="" disabled selected>Select Bus Type</option>
							        <option value="cityBus">City or Transit Bus</option>
							        <option value="intercityBus">Intercity or Coach Bus</option>
							        <option value="doubleDeckerBus">Double-Decker Bus</option>
							        <option value="minibus">Minibus</option>
							        <option value="schoolBus">School Bus</option>
							        <option value="articulatedBus">Articulated (Bendy) Bus</option>
							        <option value="electricBus">Electric Bus</option>
							        <option value="luxuryBus">Luxury or Sleeper Bus</option>
							        <option value="touristBus">Tourist or Sightseeing Bus</option>
							        <option value="shuttleBus">Shuttle Bus</option>
							        <option value="hybridBus">Hybrid Bus</option>
							        <option value="paratransitBus">Paratransit Bus</option>
							    </select>
				       </div>
				       <br>
				       
				       <div>
				       <h6>Route</h6>  <input type="text" class="form-control" name="route" id="route" disabled>
				       </div>
				       <br>
				       
				       <h6>
							  <label for="email">Select Route</label>
						  </h6>
							  <select class="form-control" name="routeSelect" id="routeSelect">
					        <option value="" disabled selected>Select a route</option>
					        <%
						        RouteService rservice = new RouteService();
								try {
									List<Route> routes = rservice.getRouteName();
									for(Route rt: routes){
										out.print("<option value="+rt.getRoute_id()+">"+rt.getRoute_name()+"</option>");
									}
									
	
								}catch (SQLException | ClassNotFoundException e) {
						            e.printStackTrace();
						        }
								%>
					    </select>
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
				       
				       <h4>Cancel Buses</h4>
				       <form action="DeleteBusAdmin" method="POST">
				       <div class="form-group">
					        <label>Bus Id</label>
					        <input type="text" name="bus_id"/>
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
        $('#busSelect').change(function () {
            var busId = $(this).val();
            if (busId) {
                $.ajax({
                    url: 'UpdateBusAdmin', // This is the URL for the servlet that handles the request
                    type: 'GET',
                    data: { bus_id: busId },
                    success: function (response) {
                        $('#bus_capacity').val(response.Capacity);
                        $('#bus_type_display').val(response.BusType);
                        $('#route').val(response.routeName);
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