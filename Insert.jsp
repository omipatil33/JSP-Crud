<%@    page   import="java.sql.*"   %>

<html>
<body>

<%

     int sno=Integer.parseInt(request.getParameter("sno"));
     String sname=request.getParameter("sname");
     String gender=request.getParameter("gender");
     String swim=request.getParameter("swim");
     String read=request.getParameter("read");
     String cricket=request.getParameter("cricket");

     if(swim==null)
            swim="0";
     else
            swim="1";

     if(read==null)
            read="0";
     else
            read="1";

     if(cricket==null)
            cricket="0";
     else
            cricket="1";

     Connection con=null;

     try
       {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sachin"); 

         String query="Insert into student values(" + sno + ",'" + sname + "','" + gender + "','" + swim + "','" + read + "','" + cricket + "')"; 

         Statement stmt=con.createStatement();          
         stmt.executeUpdate(query);

         stmt.close();
         con.close(); 
       }
     catch(Exception e)
       {
         System.out.println(e);
       }
%>

<script language="javascript">
   alert("Record added succ");
   document.location.href="List.jsp";
</script>

</body>
</html>