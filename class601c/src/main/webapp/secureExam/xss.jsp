<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>XSS Sample</h1>
	<%
	 	String name = request.getParameter("name");
	
	if ( name != null ) {
	name = name.replaceAll("<","&lt;");
	name = name.replaceAll(">","&gt;");
	} else {
	return;
	}
	%>	
	<p>
		NAME:<%=name%></p>

</body>
</html>