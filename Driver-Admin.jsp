<%@page import="model.Users"%>
<%@page import="service.UserService"%>
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@300;400;500;600&display=swap">
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
                <small>Driver</small>
            </div>

            <div class="side-menu">
                <ul>
                    <li>
                       <a href="index.jsp">
                            <span class="las la-home"></span>
                            <small>Home</small>
                        </a>
                    </li>
                    <li>
                        <a href="Driver-Admin.jsp" class="active">
                             <span class="las la-users" ></span>
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
                <span>Driver</span>
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
            <div class="container mt-4">
                <div class="row">
                    <div class="col-lg-8 col-xl-7">
                        <h4>Edit Profile</h4>
                        <br>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-md-6">
                        <%
                            Integer id = (Integer) session.getAttribute("UserId");
                            if (id == null) {
                                response.sendRedirect("Login.jsp"); 
                                return;
                            }
                            UserService service = new UserService();
                            List<Users> user = service.getUserData(id);
                            
                            if(user!=null){
                                for(Users usr : user){
                        %>
                                    <div class="mb-3">
                                        <p><strong>Name:</strong> <%= usr.getUserName() %></p>
                                        <p><strong>Email:</strong> <%= usr.getEmail() %></p>
                                        <p><strong>Phone Number:</strong> <%= usr.getPhone() %></p>
                                    </div>
                        <%       }
                            } else {
                                response.sendRedirect("/Login.jsp");
                            }
                        %>
                    </div>
                    <div class="col-12 col-md-6">
                        <!-- Update Password -->
                        <form action="UpdatePassword" method="post" class="mb-4">
                            <div class="form-group">
                                <label for="newPassword">New Password</label>
                                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Update Password</button>
                        </form>

                        <!-- Update Phone Number -->
                        <form action="UpdatePhoneNumber" method="post" class="mb-4">
                            <div class="form-group">
                                <label for="phoneNumber">Phone Number</label>
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Update Phone Number</button>
                        </form>
                        
                        <!-- Display success or error messages -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-success">
                                <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
                                ${errorMessage}
                            </div>
                        </c:if>

                        <!-- Delete Profile -->
                        <form action="DeleteUser" method="post">
                            <button type="submit" class="btn btn-danger btn-block">Delete Profile</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>      
    </div>
</body>
</html>
