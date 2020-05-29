<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Haz Login</title>
</head>
<body>
	<%
	String usuario = request.getParameter("usuario");
	String password = request.getParameter("password");
	int logeado = 0; 
	
	
	//preguntar a la base de datos si este usuario existe
	
	try{
		String conexion  = "jdbc:mysql://127.0.0.1:3306/webcalendario"; 
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(conexion,"web","calendario");
		
		Statement  stmt = connection.createStatement();
		ResultSet rset; 
		String peticion = "SELECT * FROM usuarios WHERE usuario = '"+usuario+"' AND contrasena ='"+password+"' "; 
		rset = stmt.executeQuery(peticion);
		
	//mostrar en la pantalla mientras tengas datos qte mostrar. 
		while(rset.next()){
			logeado = 1; 
			session.setAttribute("idusuario", rset.getInt("idusuario")); 
		}
		if(logeado == 1){
			session.setAttribute("usuario", usuario); 
			out.println("<meta http-equiv = 'refresh' content = '0; url=../index.jsp'>");  
		}else{
			out.println("<meta http-equiv = 'refresh' content = '0; url=../login.jsp'>"); 
		}
	
	
		stmt.close(); 
		connection.close();  // Se cierra la conexion a la DB. 
		
	}catch(Exception ex){
		out.println("Ha ocurrido el siguiente error" + ex.getMessage().toString()); 
	}

		
	
	%>

</body>
</html>