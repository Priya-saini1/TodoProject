<%@page import="com.entities.Todo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="container">
	<h4>demo</h4>
	<form:form action="${pageContext.request.contextPath}/saveTodo" method="post" modelAttribute="todo">
			<div class="form-group">
				<form:input path="todoId" cssClass="form-control"></form:input>
			</div>
			<div class="form-group">
				<form:input path="todoTitle" cssClass="form-control" placeholder="Enter your title"></form:input>
			</div>
			<div class="form-group mt-4">
				<form:textarea path="todoContent" cssClass="form-control" placeholder="Enter your todo details"/>
			</div>
			
			<div class="container text-center mt-5" >
			<c:set var="context" value="${pageContext.request.contextPath}" />
					<a href="${context}/" class="btn btn-outline-secondary">back</a>
               <%-- <a href="${Pagecontext.request.ContextPath()}/" class="btn btn-outline-secondary">back</a> --%>
				<button class="btn btn-outline-success">changes</button>
			</div>		
</form:form>
	
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>