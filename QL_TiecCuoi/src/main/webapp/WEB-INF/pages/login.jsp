<%-- 
    Document   : login
    Created on : 20 thg 8, 2023, 22:54:22
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .login-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-card {
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
</style>

<div class="login-container">
    <div class="login-card">
        <h1>ĐĂNG NHẬP</h1>

        <c:if test="${param.error != null}">
            <div class="alert alert-danger">
                Đã có lỗi xảy ra! Vui lòng quay lại sau!
            </div>
        </c:if>

        <c:if test="${param.accessDenied != null}">
            <div class="alert alert-danger">
                Bạn không có quyền truy cập!!!
            </div>
        </c:if>

        <c:url value="/login" var="action" />

        <form method="post" action="${action}">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-control">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control">
            </div>
            <div class="mb-3">
                <input type="submit" value="ĐĂNG NHẬP" class="btn btn-danger">
            </div>
        </form>
    </div>
</div>
