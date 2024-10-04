<%@page import="university.dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String e=request.getParameter("email");
String p=request.getParameter("password");
String cp=request.getParameter("cpassword");

if(p.equals(cp)){ 
	int r = StudentDao.updatePassword(e,p);
    if(r>0){
    	response.sendRedirect("studentLogin.jsp?msg=Password Updated successfully");
    }
}
else{
	response.sendRedirect("reset-password.jsp?error='password dosent match'");
}

%>
</body>
</html>