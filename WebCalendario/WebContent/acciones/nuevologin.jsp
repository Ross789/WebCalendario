<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv = "refresh" content = "0; url= ../index.jsp">

<title>Nuevo Usuario</title>
</head>
<body> 
	 <%
		try{// conexion para INSERTAR eventos en la BD. 
			String conexion  = "jdbc:mysql://127.0.0.1:3306/webcalendario"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			connection = DriverManager.getConnection(conexion,"web","calendario");
			
			Statement  stmt = connection.createStatement();
			stmt.executeUpdate("INSERT INTO usuarios VALUES (NULL,'"+request.getParameter("usuario")+"','"+request.getParameter("password")+"','"+request.getParameter("nombre")+"','"+request.getParameter("apellidos")+"','"+request.getParameter("email")+"');"); 
			
			stmt.close(); 
			connection.close();  // Se cierra la conexion a la DB. 
			out.println("<meta http-equiv = 'refresh' content = '0; url= ../login.jsp'> ");
		}catch(Exception ex){
			out.println("Ha ocurrido el siguiente error" + ex.getMessage().toString()); 
		}						
	%>
	
</body>
</html>