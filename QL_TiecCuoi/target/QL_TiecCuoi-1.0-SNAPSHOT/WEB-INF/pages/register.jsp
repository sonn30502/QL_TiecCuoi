<%-- 
    Document   : register
    Created on : 17 thg 8, 2023, 21:57:17
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .register-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .register-card {
        max-width: 400px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #dc3545;
        margin-bottom: 20px;
    }

    .btn-primary:hover {
        background-color: #dc3545;
        border-color: #dc3545;

    }
</style>

<<div class="register-container">
    <div class="register-card">
        <h1>ĐĂNG KÝ</h1>

        <c:if test="${errMsg != null}">
            <div class="alert alert-danger">
                ${errMsg}
            </div>
        </c:if>

        <c:url value="/register" var="action" />
        <form:form action="${action}" method="post" modelAttribute="user" enctype="multipart/form-data">
            <form:hidden path="profileImage" />
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
            <div class="form-floating mb-3 mt-3">
                <form:input type="file" class="form-control" path="file" id="file" name="file" />
                <label for="file">Ảnh đại diện</label>
            </div>
            <button type="submit" class="btn btn-primary">Đăng ký</button>
        </form:form>
    </div>
</div>


