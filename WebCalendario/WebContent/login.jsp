<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<h1>Introduce tu usuario</h1>
	<form method = "POST" action = "acciones/hazlogin.jsp"><br>
		<input type = "text" name= "usuario" placeholder = "usuario"><br>
		<input type = "text" name= "password" placeholder = "password"><br>
		<input type = "submit">
	</form>
	
	<h1>Registrate!</h1>
	<form method = "POST" action = "acciones/nuevologin.jsp"><br>
		<input type = "text" name= "usuario" placeholder = "usuario"><br>
		<input type = "text" name= "password" placeholder = "password"><br>
		<input type = "text" name= "nombre" placeholder = "nombre"><br>
		<input type = "text" name= "apellidos" placeholder = "apellidos"><br>
		<input type = "text" name= "email" placeholder = "email"><br>
		<input type = "submit">
	</form>
	
</body>
</html>