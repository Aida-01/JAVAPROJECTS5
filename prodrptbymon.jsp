 <%@ page language="java" import="java.sql.*,java.util.Calendar"%>
 <%! String pss="";%>
 <p align="center"><b><i><font face="Book Antiqua" size="4">Reports based on Month</font></i></b>
<br>
<br>
 <table border=1>
<tr>
                  <td>Quantity</td>
                  <td>Amount</td>
                  <td>Date</td>
</tr>
 <%
    String pcc=request.getParameter("pc");
    
    String daa=request.getParameter("mon1");
    String yya=request.getParameter("yyy");
    
   
   String mon= "";
           
       if(daa.equals("January"))
           mon="01";
       if(daa.equals("February"))
           mon="02";
       if(daa.equals("March"))
           mon="03";
       if(daa.equals("April"))
           mon="04";
       if(daa.equals("May"))
           mon="05";
       if(daa.equals("June"))
           mon="06";
       if(daa.equals("July"))
           mon="07";
       if(daa.equals("August"))
           mon="08";
       if(daa.equals("September"))
           mon="09";
       if(daa.equals("October"))
           mon="10";
       if(daa.equals("November"))
           mon="11";
       if(daa.equals("December"))
           mon="12";
       
       
          
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
       Connection cs=DriverManager.getConnection("jdbc:odbc:espace","sa","");
      
       //Statement stat=cs.createStatement();
       PreparedStatement pp=cs.prepareStatement("select * from orderprocess where prcode=?" );
       pp.setString(1,pcc);
       ResultSet rs=pp.executeQuery();
       while(rs.next())
       {
       
          	int am=rs.getInt(5);
	  	       int qu=rs.getInt(6);
	  	       
	  	      
	  	      
	  	       Date ddd=rs.getDate(8);
	  		
	  	       String sss=String.valueOf(ddd);
	  	       int find=sss.indexOf('-');
	  	       int la=sss.lastIndexOf('-');
	  	       String yys=sss.substring(0,find);
	  	       String mons=sss.substring(find+1,la);
	  	         if(mons.equals(mon))
		                {
		                  if(yys.equals(yya))
		                  {
           
      %>
      <tr>
      	<td><%=am%></td>
      	<td><%=qu%></td>
      	<td><%=sss%></td>
         	</tr>
         	<%
         	}
         	}
       }
       	   	
       	
   	%>
     
