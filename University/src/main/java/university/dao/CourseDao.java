package university.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import university.model.*;

public class CourseDao {

	private static Connection con =null;
	private static PreparedStatement st = null;
	private static ResultSet rs = null;
	private static int result = 0;
	
	private static Connection conn()
	{
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","123456");
	    
	}catch(ClassNotFoundException|SQLException e)
	{
		e.printStackTrace();
	}
	return con;
	}
	
	public static List<Course> ListOfCourse() {
		
		con=conn();
		List<Course> l = new ArrayList<Course>();
		try {
			st=con.prepareStatement("select * from courses");
			rs=st.executeQuery();
			while(rs.next())
			{
				Course c = new Course();
				c.setId(rs.getInt(1));
				c.setDescription(rs.getString(2));
				c.setName(rs.getString(3));
				l.add(c);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return l;	
	}
	
}
