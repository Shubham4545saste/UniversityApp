<%@page import="university.dao.*"%>
<%@page import="university.model.*"%>
<%@page import="java.util.List"%> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./style1.css">
   <link rel="stylesheet" href="./css/styles.css">
<%
Student s = (Student)session.getAttribute("stud");

if(s==null)
{
	   response.sendRedirect("studentLogin.jsp");
}
%>
<% 
List <Course> list=CourseDao.ListOfCourse();

List<Course> elist=EnrollDao.getEnrollCourseByStudentId(s.getSid());
%>
</head>
<body>

<header>
  <!-- <div class="logo">
   <img src="./logo.jsp" alt="University Logo">-->
    <h1>Welcome to Your Dashboard</h1>
   </header>
<main>
 <div class="content">
        <h2>Hello, <%= s.getName() %></h2>
        <p>Welcome to your Course dashboard. Here you can find your course details, updates, and more.</p>
        <div class="profile-link">
        	<% session.setAttribute("student", s); %>
            <a href="StudentProfile.jsp">Back to Home Page</a>
        </div>
    </div>
    
    <div class="content">
    <h2>Course Details:</h2>
        <p>List of Courses</p>
        
        
  
  <table>
  <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Action</th>
    </tr>
    <%for(Course course:list){ %>
    <tr>
    <td><%=course.getId() %></td>
    <td><%= course.getName() %></td>
    <td><%= course.getDescription() %></td>
    <td>
                    <form action="enroll.jsp" method="post">
                        <input type="hidden" name="courseId" value="<%= course.getId() %>">
                        <input type="hidden" name="studentId" value="<%= s.getSid() %>">
                        <input type="submit" class="logout-link" value="Enroll">
                    </form>
                </td>
            </tr>
         <% } %>
           </table>
    </div>
</main>
<footer>
    <p>&copy; 2024 Student Dashboard. All rights reserved.</p>
</footer>
</body>
</html>