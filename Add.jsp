<%@    page   import="java.sql.*"   %>

<html>
<body>

<%
     Connection con=null;
     int sno=0;

     try
       {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sachin"); 

         String query="Select max(sno) maxnum from student"; 

         Statement stmt=con.createStatement();          
         ResultSet rs=stmt.executeQuery(query);

         while(rs.next())
           {
             sno=rs.getInt("maxnum");
           }

         rs.close();
         stmt.close();
         con.close(); 
       }
     catch(Exception e)
       {
         System.out.println(e);
       }

     sno++;
%>

<form action="Insert.jsp">

<table bgcolor="yellow" align="center">

<tr>
<td>Student No:</td>
<td><%=sno %><input type="hidden" name="sno" value="<%=sno %>"></td>
</tr>

<tr>
<td>Student Name:</td>
<td><input type="text" name="sname"></td>
</tr>

<tr>
<td>Gender:</td>
<td>
<input type="radio" name="gender" value="M">Male
<input type="radio" name="gender" value="F">Female
</td>
</tr>

<tr>
<td>Hobbies:</td>
<td>
<input type="checkbox" name="swim">Swimming
<input type="checkbox" name="read">Reading
<input type="checkbox" name="cricket">Cricket
</td>
</tr>

<tr>
<th colspan="2"><input type="submit" value="Submit"></th>
</tr>

</table>

</form>

</body>
</html>







