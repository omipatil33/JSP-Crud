<%@    page   import="java.sql.*"   %>

<html>
<body>

<center>
<a href="Add.jsp">Add New Student</a>
<br>
</center>

<%
     Connection con=null;

     try
       {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sachin"); 

         String query="Select * from student order by sno"; 

         Statement stmt=con.createStatement();          
         ResultSet rs=stmt.executeQuery(query);
%>

<table border="1" align="center" bgcolor="yellow">
<tr>
<th>Student No</th>
<th>Student Name</th>
<th>Update</th>
</tr>

<%
         int sno=0;

         while(rs.next())
           {
             sno=rs.getInt("sno");
%>

<tr>
<td> <%=sno  %> </td>
<td> <%=rs.getString("sname")  %> </td>
<td> <a href="Update.jsp?sno=<%=sno  %>">Update</a> </td>
</tr>

<%
           }
%>

</table>

<%
         rs.close();
         stmt.close();
         con.close(); 
       }
     catch(Exception e)
       {
         System.out.println(e);
       }
%>

</body>
</html>