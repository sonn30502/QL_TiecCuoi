<%-- 
    Document   : header
    Created on : 18 thg 8, 2023, 23:17:51
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="action" />
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">WEDDING</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${action}">Trang chủ</a>
                </li>

                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <!-- Liên kết hiển thị khi đã đăng nhập -->
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/' />">${pageContext.request.userPrincipal.name}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/logout' />">Đăng xuất</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <!-- Liên kết hiển thị khi chưa đăng nhập -->
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/login' />">Đăng nhập</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/register' />">Đăng ký</a>
                        </li>

                    </c:otherwise>
                </c:choose>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/list_halls' />">Sảnh cưới</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/branch' />">Chi nhánh</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/menu' />">Menu</a>
                </li>
            </ul>

            <form class="d-flex" action="<c:url value='/list_halls' />">
                <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa...">
                <button class="btn btn-primary" type="submit">Tìm</button>
            </form>

           

        </div>
    </div>
</nav>
