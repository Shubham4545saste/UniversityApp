<%@page import="university.model.Student , university.dao.*"%>

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
<%System.out.print(s);
int r= StudentDao.updateStudent(s);
if(r>0){ 
response.sendRedirect("StudentProfile.jsp?msg=Profile Updated Successfully");
}
else{
	response.sendRedirect("index.jsp?error=Please fill all details");
}
 %>
</body>
</html>