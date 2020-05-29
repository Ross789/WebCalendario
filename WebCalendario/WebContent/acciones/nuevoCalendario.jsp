<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv = "refresh" content = "0; url= ../index.jsp">

<title>Modelo</title>
</head>
<body> 
	 <%
		try{// conexion para INSERTAR eventos en la BD. 
			String conexion  = "jdbc:mysql://127.0.0.1:3306/webcalendario"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			connection = DriverManager.getConnection(conexion,"web","calendario");
			
			Statement  stmt = connection.createStatement();
			stmt.executeUpdate("INSERT INTO calendarios VALUES (NULL,"+session.getAttribute("idusuario")+",'"+request.getParameter("nombrecalendario")+"','139,139,199')"); 
			
			stmt.close(); 
			connection.close();  // Se cierra la conexion a la DB. 
			
		}catch(Exception ex){
			out.println("Ha ocurrido el siguiente error" + ex.getMessage().toString()); 
		}						
	%>
	
</body>
</html>