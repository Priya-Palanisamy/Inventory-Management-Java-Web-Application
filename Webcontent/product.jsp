   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ page import="java.sql.*" %>
    
    <%
       if(request.getParameter("submit")!=null)
       {
    	   String pname=request.getParameter("pname");
    	   String warehouse=request.getParameter("warehouse");
    	   String quantity=request.getParameter("quantity");
    	   
    	   Class.forName("com.mysql.jdbc.Driver");
    	   java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","easu123");
    	   PreparedStatement pst=con.prepareStatement("insert into product(pname,warehouse,quantity) values(?,?,?)");
    	   pst.setString(1,pname);
    	   pst.setString(2,warehouse);
    	   pst.setString(3,quantity);
    	   pst.executeUpdate();
     %>
     <script>
         alert("Record Added");
     </script>
     <%
       }
     %>
    
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="ISO-8859-1"">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Product Details</h1>
        </br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" > 
                    
                    <div alight="left">
                        <label class="form-label">Product Name</label>
                        <input type="text" class="form-control" placeholder="Product Name" name="pname" id="pname" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Warehouse</label>
                        <input type="text" class="form-control" placeholder="warehouse" name="warehouse" id="warehouse" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Quantity</label>
                        <input type="text" class="form-control" placeholder="quantity" name="quantity" id="quantity" required >
                     </div>
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Product Name</th>
                                    <th>Warehouse</th>
                                    <th>Quantity</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/inventory","root","easu123");
                                
                                  String query = "select * from product";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("pname") %></td>
                                 <td><%=rs.getString("warehouse") %></td>
                                 <td><%=rs.getString("quantity") %></td>
                                 <td><a href="edit.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>
 
            </div>  
        </div>
 
    </body>
</html>
