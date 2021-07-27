<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    
    <%
    String uname=request.getParameter("uname");
    session.putValue("Uname",uname);
    String pwd=request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","easu123");
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from login where Uname='"+uname+"'");
    if(rs.next())
    {
    	if(rs.getString(2).equals(pwd))
    	{
    		response.sendRedirect("product.jsp");
    		
    	}
    	else
    	{
    		out.println("Invalid Password");
    	}
    }
    
    else
    {
    	out.println("Invalid Username");
    }
    
    %>
    
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <form action="#" method="post">
		<table>
			<tr>
				<td>User Name</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
			    <td></td>
				<td><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>		
</body>
</html>   