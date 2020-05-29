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
	 /* 
	 	out.println("El año recogido es: " + request.getParameter("anio")); 
	    out.println("El mes recogido es: " + request.getParameter("mes"));
	    out.println("El dia recogido es: " + request.getParameter("dia"));
	    out.println("El calendario recogido es: " + request.getParameter("calendario"));
	    out.println("la hora de inicio es: " + request.getParameter("hora"));
	    out.println("El minuto de inicio recogida es de: " + request.getParameter("minuto"));
	    out.println("La duracio del evento es: " + request.getParameter("duracion"));
	    out.println("El nombre del evento es: " + request.getParameter("nombre"));
	    */
	 %>
	 
	 <%
		try{// conexion para INSERTAR eventos en la BD. 
			String conexion  = "jdbc:mysql://127.0.0.1:3306/webcalendario"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			connection = DriverManager.getConnection(conexion,"web","calendario");
			
			Statement  stmt = connection.createStatement();
			stmt.executeUpdate("INSERT INTO eventos VALUES (NULL,"+request.getParameter("calendario") +",'"+request.getParameter("nombre")+"',"+request.getParameter("anio")+","+request.getParameter("mes")+","+request.getParameter("dia")+","+request.getParameter("hora")+","+request.getParameter("minuto")+",0,"+request.getParameter("duracion")+")"); 
			
			stmt.close(); 
			connection.close();  // Se cierra la conexion a la DB. 
			
		}catch(Exception ex){
			out.println("Ha ocurrido el siguiente error" + ex.getMessage().toString()); 
		}
		
								
	%>
	
</body>
</html>