<%@page import="university.dao.*, university.model.*"%>
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
String u =request.getParameter("email");
String p = request.getParameter("password");

Student s = StudentDao.login(u, p);
System.out.println(s);

if(s.getSid()!=0) 
{
	session.setAttribute("stud", s);
	response.sendRedirect("StudentProfile.jsp");
}
else{
	response.sendRedirect("studentLogin.jsp?error=invalid credentials");
}
%>
</body>
</html>