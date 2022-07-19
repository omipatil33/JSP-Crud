<%@    page   import="java.sql.*"   %>

<html>
<body>

<%
     Connection con=null;
     int sno=Integer.parseInt(request.getParameter("sno"));
     String sname="", gender="", swim="", read="", cricket="";
     String gen1="", gen2="";
     String hb1="", hb2="", hb3="";
     
     try
       {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sachin"); 

         String query="Select * from student where sno=" + sno; 

         Statement stmt=con.createStatement();          
         ResultSet rs=stmt.executeQuery(query);

         if(rs.next())
           {
             sname=rs.getString("sname");
             gender=rs.getString("gender");
             swim=rs.getString("swim");
             read=rs.getString("read");
             cricket=rs.getString("cricket");
           }

         rs.close();
         stmt.close();
         con.close(); 
       }
     catch(Exception e)
       {
         System.out.println(e);
       }

      if(gender.equals("M"))
                  gen1="checked";
      else
                  gen2="checked";

      if(swim.equals("1")) hb1="checked";

      if(read.equals("1")) hb2="checked";

      if(cricket.equals("1")) hb3="checked";
%>

<form action="Edit.jsp">

<table bgcolor="yellow" align="center">

<tr>
<td>Student No:</td>
<td><%=sno %><input type="hidden" name="sno" value="<%=sno %>"></td>
</tr>

<tr>
<td>Student Name:</td>
<td><input type="text" name="sname"  value="<%=sname %>"></td>
</tr>

<tr>
<td>Gender:</td>
<td>
<input type="radio" name="gender" value="M" <%=gen1 %>>Male
<input type="radio" name="gender" value="F" <%=gen2 %>>Female
</td>
</tr>

<tr>
<td>Hobbies:</td>
<td>
<input type="checkbox" name="swim" <%=hb1 %>>Swimming
<input type="checkbox" name="read" <%=hb2 %>>Reading
<input type="checkbox" name="cricket"  <%=hb3 %>>Cricket
</td>
</tr>

<tr>
<th colspan="2"><input type="submit" value="Submit"></th>
</tr>

</table>

</form>

</body>
</html>







