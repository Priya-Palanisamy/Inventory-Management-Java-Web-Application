<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String pname = request.getParameter("pname");
        String warehouse= request.getParameter("warehouse");
        String quantity = request.getParameter("quantity");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/inventory","root","easu123");
        pst = con.prepareStatement("update product set pname = ?,warehouse =?,quantity= ? where id = ?");
        pst.setString(1, pname);
        pst.setString(2, warehouse);
        pst.setString(3, quantity);
        pst.setString(4, id);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("Record Updateddddd");           
       </script>
    <%             
    }
 
%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        
        
    </head>
    <body>
        <h1>Product Update</h1>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/inventory","root","easu123");
                           
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from product where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Product Name</label>
                        <input type="text" class="form-control" placeholder="Product Name" value="<%= rs.getString("pname")%>" name="pname" id="pname" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Warehouse</label>
                        <input type="text" class="form-control" placeholder="Warehouse" name="warehouse" value="<%= rs.getString("warehouse")%>" id="warehouse" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Quantity</label>
                        <input type="text" class="form-control" placeholder="Quantity" name="quantity" id="quantity" value="<%= rs.getString("quantity")%>" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="product.jsp">Click Back</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        </div>
  
    </body>
</html>