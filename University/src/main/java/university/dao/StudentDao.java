package university.dao;

import university.model.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDao {
	
	private static Connection con= null;
    private static PreparedStatement st = null;
	private static int result = 0;
	private static ResultSet  rs=null;
	
	private static Connection conn()
	{
		try 
		{    

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "123456");
		}
		catch(ClassNotFoundException|SQLException e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
	public static int register(Student s)
	{
		con=conn();
		try {	
		st =con.prepareStatement("insert into student(address,education,email,mob,name,password)values(?,?,?,?,?,?)");
		st.setString(1, s.getAddress());
		st.setString(2, s.getEducation());
		st.setString(3, s.getEmail());
		st.setString(4, s.getMob());
		st.setString(5, s.getName());
		st.setString(6, s.getPassword());
		result= st.executeUpdate();
		
		if(result>0) {
			System.out.println("Query executed data inserted");
		}
	    }
		catch(SQLException e)
		{
			e.printStackTrace();	
		}
		return result;
	}
	
	
	
	public static Student login(String u, String p)
	{
	con=conn();	
	Student s=new Student();
	try {
		st=con.prepareStatement("select * from student where email=? and password=?");
	    st.setString(1,u);
	    st.setString(2, p);
	    rs=st.executeQuery();
	    
	    while(rs.next())
	    {
	    	s.setSid(rs.getInt("sid"));
	    	s.setName(rs.getString("name"));
			s.setAddress(rs.getString("address"));
			s.setEmail(rs.getString("email"));
			s.setPassword(rs.getString("password"));
			s.setMob(rs.getString("mob"));
			s.setEducation(rs.getString("education"));
	    }
	
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
		return s;
	}
	
	public static int updateStudent(Student s) {
		con=conn();
		int r = 0;
		try {
			st=con.prepareStatement("update student set address=?,education=?,email=?,mob=?, name=?, password=? where sid=?");
			st.setString(1, s.getAddress());
			st.setString(2, s.getEducation());
			st.setString(3, s.getEmail());
			st.setString(4, s.getMob());
			st.setString(5, s.getName());
			st.setString(6, s.getPassword());
			st.setInt(7, s.getSid());
			r=st.executeUpdate();
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
	return r;
}
	
public static int updatePassword(String e, String p) {
	con=conn();
	int r = 0;
	try {
		st=con.prepareStatement("update student set password=? where email=?");
		st.setString(1, p);
		st.setString(2, e);
		r=st.executeUpdate();
	}
	catch(SQLException ex)
	{
		ex.printStackTrace();
	}
	return r;
}

public static boolean findUserByEmail(String e)
{
	con=conn();
	boolean r=false;
	try 
	{
		st=con.prepareStatement("select * from student where email=?");
		st.setString(1, e);
		rs= st.executeQuery();
		r=rs.next();
	}
	catch(SQLException ex)
	{
		ex.printStackTrace();
	}
	return r;
}

}


