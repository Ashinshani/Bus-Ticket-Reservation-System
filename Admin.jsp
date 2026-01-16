<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Integer user = (Integer) session.getAttribute("UserId");
		if (user == null) {
			response.sendRedirect("Login.jsp");
		} else {
			Integer level = (Integer) session.getAttribute("UserLevel");
			out.print(level);
			if(level!=3){
				response.sendRedirect("index.jsp");
			}			
		}		
%>    
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
                       <a href="Admin.jsp" class="active">
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
                <span>Dashboard</span>
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
               
                
            
            </div>      
    </div>
</body>
</html>