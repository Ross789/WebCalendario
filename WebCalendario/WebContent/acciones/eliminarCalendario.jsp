<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv = "refresh" content = "0; url= ../index.jsp">
<title>EliminarCalendario</title>
</head>
<body>

 <%
	try{// conexion para ELIMINAR calendarios en la BD. 
		String conexion  = "jdbc:mysql://127.0.0.1:3306/webcalendario"; 
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(conexion,"web","calendario");
		
		Statement  stmt = connection.createStatement();
		stmt.executeUpdate("DELETE FROM calendarios WHERE idcalendario = "+request.getParameter("idcalendario")+""); 
		//Eliminar los eventos asociados al calenadrio
		stmt.executeUpdate("DELETE FROM eventos WHERE calendario = "+request.getParameter("idcalendario")+""); 
		
		stmt.close(); 
		connection.close();  // Se cierra la conexion a la DB. 
		
	}catch(Exception ex){
		out.println("Ha ocurrido el siguiente error" + ex.getMessage().toString()); 
	}
		
 %>
</body>
</html>