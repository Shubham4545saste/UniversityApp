<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Registration Form</title>
<link rel="stylesheet" href="./styles.css">
</head>
<body>

<div class= "form-container">
     <h2>Course Enquiry Form</h2>

<form action="addinquiry.jsp" method="post">
 
 <div class="form-group">
 <label for="name">Name</label>
 <input type="text" id="name" name="name" required/>
 </div>
 
  <div class="form-group">
 <label for="email">Email</label>
 <input type="email" id="email" name="email" required/>
 </div>
 
   <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="mob">Mobile No. </label>
            <input type="text" id="mob" name="mob" required>
        </div>
        <div class="form-group">
            <label for="edu">Education </label>
            <input type="text" id="education" name="education" required>
        </div>
        
        <div class="form-buttons">
        <button type="submit" class="submit-btn">Submit</button>
        <button type="reset" class="reset-btn">Reset</button>
         </div>
         
         <p style="text-align:center">Already have an account?<a href="studentLogin.jsp">Login</a></p>
 </form>
</div>

</body>
</html>