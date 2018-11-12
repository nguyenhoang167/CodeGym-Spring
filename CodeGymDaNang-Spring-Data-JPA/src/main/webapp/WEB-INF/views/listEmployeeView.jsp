<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.howtodoinjava.demo.model.EmployeeEntity" %>
<html lang="en">
<head>
    <title>Employee Management</title>
    <style>
    .error 
    {
        color: #ff0000;
        font-weight: bold;
    }
    #listOfEmployees tr:first-child{
        font-weight: bold;
    }
    </style>
</head>
 
<body>
     
 
    <table id="listOfEmployees" border="1">
    <tr>
        <td>ID</td>
        <td>First Name</td>
        <td>Last Name</td>
        <td>Email</td>
        
      </tr>
	<%
		List<EmployeeEntity> employees = (List<EmployeeEntity>)request.getAttribute("lists"); 
		for (EmployeeEntity employee : employees) {
	%>
      <tr>
        <td><%=employee.getId() %></td>
        <td><%=employee.getFirstName() %></td>
        <td><%=employee.getLastName() %></td>
        <td><%=employee.getEmail() %></td>
       
      </tr>
    <% } %>
    </table>
 
   
</body>
</html>