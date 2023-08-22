<%-- 
    Document   : login
    Created on : 20 thg 8, 2023, 22:54:22
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="text-center text-danger">DANG NHAP</h1>

<c:if test="${param.error != null}">
    <div>
        Đã có lỗi xảy ra! Vui lòng quay lại sau!
    </div>
</c:if>

<c:if test="${param.accessDenied}">
    <div class="alert alert-danger">
        Bạn không có quyền truy cập!!!
    </div>
</c:if>
<c:url value="/login" var="action" />

<form method="post" action="${action}" >
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name ="username" class="form-control">
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name ="password" class="form-control">
    </div>
    <div class="form-group">
        <input type="submit" value="DANG NHAP"/>
    </div>
</form>
