<%-- 
    Document   : register
    Created on : 17 thg 8, 2023, 21:57:17
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class="text-center text-danger">ĐĂNG KÝ</h1>
<c:if test="$errMsg != null">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>
<c:url value="/register" var="action" />
<form:form action="${action}" method="post" modelAttribute="user">
    <div class="mb-3">
        <label for="firstName" class="form-label">First Name:</label>
        <form:input type="text" class="form-control" id="firstName" path="firstName"/>
    </div>
    
    <div class="mb-3">
        <label for="lastName" class="form-label">Last Name:</label>
        <form:input type="text" class="form-control" id="lastName" path="lastName"/>
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email:</label>
        <form:input type="email" class="form-control" id="email" path="email"/>
    </div>
    <div class="mb-3">
        <label for="username" class="form-label">Username:</label>
        <form:input type="text" class="form-control" id="username" path="username"/>
    </div>
    <div class="mb-3">
        <label for="password" class="form-label">Password:</label>
        <form:input type="password" class="form-control" id="password" path="password"/>
    </div>
    <div class="mb-3">
        <label for="confirmPassword" class="form-label">Confirm Password:</label>
        <form:input type="password" class="form-control" id="confirm-password" path="confirmPassword"/>
    </div>
    <button type="submit" class="btn btn-primary">Đăng ký</button>
</form:form>


