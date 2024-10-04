<%@page import="university.dao.EnrollDao"%>
<%@page import="university.model.Course"%>
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
int courseId =Integer.parseInt(request.getParameter("courseId"));
int studentId = Integer.parseInt(request.getParameter("studentId"));

int r=EnrollDao.enrollCourse(courseId, studentId);
if(r>0)
{
	response.sendRedirect("StudentProfile.jsp?enroll=true");
}
else if(r==0){
response.sendRedirect("StudentProfile.jsp?course=true");
}

%>
</body>
</html>