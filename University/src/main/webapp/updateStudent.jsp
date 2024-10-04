<%@page import="university.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Details</title>

   <%
   Student s=(Student)session.getAttribute("stud");
   %>
</head>
<body>


<div class="container">
<div class="profile-link">
<%session.setAttribute("student", s); %>
<a href="StudentProfile.jsp">Back to Home Page</a>
</div>
</div>

<h1>Upadate Profile</h1>
<main>
<div class="form-container">
<form action="updateStudent1.jsp" method="post">
<div class="form-group">
<input type="hidden" id="sid" name="sid"  value="<%=s.getSid() %>" required>
</div>

<div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name"  value="<%=s.getName() %>" required>
        </div>
        
<div class="form-group">
<label for="email">Email</label>
<input type="email" id="email" name="email" value="<%=s.getEmail()%>" required/>   
</div>
       
       <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" value="<%=s.getAddress() %>" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" value="<%=s.getPassword() %>" required>
        </div>
        <div class="form-group">
            <label for="mob">Mobile No. </label>
            <input type="text" id="mob" name="mob" value="<%=s.getMob() %>" required>
        </div>
       
       <div class="form-buttons">
            <button type="submit" class="submit-btn">Submit</button>
            <button type="reset" class="reset-btn">Reset</button>
        </div>
      </form> 
</div>
</main>
<footer>
    <p>&copy; 2024 Student Dashboard. All rights reserved.</p>
</footer>
</body>
</html>