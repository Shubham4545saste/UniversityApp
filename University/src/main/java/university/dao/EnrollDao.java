package university.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import university.model.Course;

public class EnrollDao {

	private static Connection con=null;
	private static PreparedStatement st=null;
	private static ResultSet  rs=null;
	private static int result=0;
	private static Connection conn()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","123456");
		}
		catch(ClassNotFoundException|SQLException e)
		{
			e.printStackTrace();
		}
		return con; 
	}
	
	public static int enrollCourse(int c, int s) {
		con=conn();
	try {
		st=con.prepareStatement("insert into enrollments(course_id,student_id)values(?,?)");
		st.setInt(1, c);
		st.setInt(2, s);
		result= st.executeUpdate();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
		return result;
	}
	
	public static List<Course> getEnrollCourseByStudentId(int s)
	{
		List<Course> elist=new ArrayList<>();
		System.out.println(s);
		con=conn();
		try {
		st=con.prepareStatement("select c.id,c.name,c.description from enrollments e join student s on s.sid=e.student_id join courses c on e.course_id=c.id where s.sid=?");
		st.setInt(1, s);
		rs=st.executeQuery();
		
		while(rs.next())
		{
			Course c=new Course();
			c.setId(rs.getInt(1));
			c.setName(rs.getString(2));
			c.setDescription(rs.getString(3));
			elist.add(c);
		}
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		System.out.println(elist);
		return elist;
	}
	
}

