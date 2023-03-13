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

<!-- <h1>This is home .jsp pages</h1> -->
<%-- <% String name =(String)request.getAttribute("name"); --%>
<%-- String intern = (String)request.getAttribute("internship");%> --%>
<%-- <h1><%=name %></h1> --%>
<%-- <h1><%=intern %></h1>  --%>

<div class="container">
<h1 class=" mt-5 text-center">Welcome this is ToDO Demo Project</h1>


<c:if test="${not empty msg}">
	<div class="alert alert-success">
		<b><c:out value="${msg}"></c:out></b>
	</div>

</c:if>
	

<div class="row">
<div class="col-md-2 mt-5">
<h3>Options</h3>
<div class="list-group">
  <button type="button" class="list-group-item list-group-item-action active" aria-current="true">
   Menu
  </button>
  <a href='<c:url value='/add'></c:url>' class="list-group-item list-group-item-action">Add</a>
  <a href='<c:url value='/home'></c:url>'class="list-group-item list-group-item-action">view</a>

</div>
</div>

<div class="col-md-10 mt-5">
<h3>Content</h3>
<c:if test="${page=='home'}">
	<h1>This is Home</h1>
	<c:forEach items="${todos}" var="t">
		<div class="card">
			<div class="card-body">
			<div class="row">
				<div class="col-10 d-flex" >
				<h3 class="ps-4"><c:out value="${t.todoId}"></c:out></h3>
				<h4 class="ps-4"><c:out value="${t.todoTitle}"></c:out></h4>
				<p class="ps-4"><c:out value="${t.todoContent}"></c:out></p>
				</div>
		
					<div class="col">
					<a href="delete/${t.todoId}" class="btn btn-outline-danger"><i class="fa-solid fa-trash-can"></i></a>
					<a href="update/${t.todoId}" class="btn btn-outline-warning" ><i class="fa-sharp fa-solid fa-pen-to-square"></i></a>
<!-- 					<button class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#exampleModal"><a><i class="fa-sharp fa-solid fa-pen-to-square"></i></a></button> -->
					</div>
				
			</div>
				
			</div>
		</div>
	</c:forEach>
	
	
</c:if>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Todo Update</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<form>
        		<div class="mb-3">
				    <label for="exampleInputtitle" class="form-label">Todo Title</label>
				    <input type="text" name="todoTitle" class="form-control" id="exampleInputtitle" 
				    value="${data.TodoTitle}">
				 </div>
				  <div class="mb-3">
                    <label for="VolunteerMessage" class="form-label text-secondary">Message</label>
                    <textarea class="form-control" name="todoContent" id="VolunteerMessage" rows="3" placeholder="Enter Your Message"></textarea>
                </div>
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<c:if test="${page=='add'}">

<form:form action="saveTodo" method="post" modelAttribute="todo">
			<div class="form-group">
				<form:input path="todoTitle" cssClass="form-control" placeholder="Enter your title"></form:input>
			</div>
			
			<div class="form-group mt-4">
				<form:textarea path="todoContent" cssClass="form-control" placeholder="Enter your todo details"/>
			</div>
			
			<div class="container text-center mt-5" >
				<button class="btn btn-outline-success">Add Todo</button>
			</div>		
</form:form>
</c:if>
</div>


</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>