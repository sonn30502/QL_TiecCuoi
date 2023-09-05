<%-- 
    Document   : list_service
    Created on : 1 thg 9, 2023, 21:33:50
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="container">
    <h1 class="text-center text-info mt-1">DANH SÁCH DỊCH VỤ</h1>
    <a href="<c:url value="/service" />" class="btn btn-info">Thêm dịch vụ</a>

    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="<c:url value="list_service" />">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="list_service" var="pageUrl">
                        <c:param name="page" value="${i}"></c:param>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>

    <table class="table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên dịch vụ</th>
                <th>Chi tiết dịch vụ</th>
                <th>Giá</th>
                <th>Chi nhánh</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${service}" var="s">
                <tr>
                    <td>${s.serviceID}</td>
                    <td>${s.serviceName}</td>
                    <td>${s.description}</td>
                    <td>${s.price}</td>
                    <td>${s.branchID.branchName}</td>

                    <td>
                        <a href="<c:url value='/service/${s.serviceID}' />" class="btn btn-success">Cập nhật</a>
                        <a href="<c:url value='/service/delete/${s.serviceID}' />" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>

                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
