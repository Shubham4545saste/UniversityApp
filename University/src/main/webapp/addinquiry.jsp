<%@page import="university.dao.StudentDao"%>
<%@page import="university.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="s" class="university.model.Student"></jsp:useBean>
<jsp:setProperty property="*" name="s"/>
<body>
<%int r= StudentDao.register(s);
if(r>0)
{
	response.sendRedirect("studentLogin.jsp");
}
else{
	response.sendRedirect("index.jsp?error='Please fill all the details in Correct Format'");
}
%>
</body>
</html>