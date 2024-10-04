<%@page import="java.util.*" %>
<%@page import="university.dao.*" %>
<%@page import="university.model.*" %>

 
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
Student s=(Student)session.getAttribute("stud");
if(s==null)
{
	response.sendRedirect("studentLogin.jsp");
}
%>


<%
List <Course> list=CourseDao.ListOfCourse();

List<Course> clist = EnrollDao.getEnrollCourseByStudentId(s.getSid());
 
HashSet <Course> elist=new HashSet<Course>(clist);
%>

</head>
<body>

<header>
   <div class="logo">
   <img src="./logo.webp" alt="University Logo">
    <h1>Welcome to Maharastra University</h1>
   </div>
   <a href="studentLogin.jsp" class="logout-link">Logout</a>
</header>

<main>

<div class="content">
<h2>Hello,<%=s.getName()%></h2>
<p>Welcome to your student dashboard. Here you can find your course details, updates, and more.</p>
<div class="profile-link">

<a href="updateStudent.jsp">Update Profile</a>||
 <a href="listofcourse.jsp">List Of Courses</a> 
  

</div>
</div>

 <div class="content">
 <% if (request.getParameter("enroll") != null) { %>
        <p style="color:green; font-weight: bold">Successfully enrolled in the course.</p>
    <% } %>
<% if (request.getParameter("course") != null) { %>
        <p style="color:red; font-weight: bold">Already enrolled in the course.</p>
    <% } %>
 <h2>My Courses</h2>
 <table>
 <tr>
            <th>ID</th>
            <th>Course ID</th>
            <th>Description</th>
            <th>Action</th>
 </tr>
 <%for(Course e:elist){%>
	 <tr>
	 <td><%=e.getId() %></td>
	    <td><%= e.getName() %></td>
          <td><%= e.getDescription() %></td>
	 <td><a href="https://www.youtube.com/watch?v=N6BghzuFLIg">
                <button type="button">Resume</button></a></td>
	 </tr>
 <%} %>
 
 </table>
  </div>

</main>
<footer>
    <p>&copy; 2024 Student Dashboard. All rights reserved.</p>
</footer>
</body>
</html>