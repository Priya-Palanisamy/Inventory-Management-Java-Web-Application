<%@page import="java.sql.*" %> 
 
 
        <% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/inventory","root","easu123");
        pst = con.prepareStatement("delete from product  where id = ?");
        pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
        
        
        <script>
            
            alert("Record Deletee");
            
        </script>
        
        <!DOCTYPE html>
        <html>
        
        <div align="right">
                             
                             <p><a href="product.jsp">Click Back</a></p>
                             
                             
        </div>
        </html>