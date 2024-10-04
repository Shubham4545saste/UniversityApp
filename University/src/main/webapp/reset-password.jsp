<%@page import="university.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./styles.css" rel="stylesheet">
</head> 
<body>
<%String email = request.getParameter("email");
boolean result=StudentDao.findUserByEmail(email);
if(result)
{
	  %>
	  <div class="form-container">
	  <%
	  String e=request.getParameter("error");
 		if(e!=null)
 			{
	 		  %>
	  		 <p style="color:red"><%=e %></p>
	  		 <% 
 			}
%>

<form action="update-password.jsp" method="post">
<div class="form-group">
<label for="email">Email</label>
            <input type="email" value="<%=email %>" id="email" name="email" required>
        </div>
      	<div class="form-group">
          <label for="password">Set New Password:  </label>
          <input type="password" id="password" name="password" required>
      	</div>
      	<div class="form-group">
          <label for="password">Repeat Password:  </label>
          <input type="password" id="password" name="cpassword" required>
      	</div>
      	<div class="form-buttons">
          <button type="submit" class="submit-btn">Reset Password</button>
       	</div>
       </form>
       <%
       }
       else
       {
    	   response.sendRedirect("forgetPassword.jsp?error=No email Found");
       }
       %>
</div>

 </form>
</body>
</html>