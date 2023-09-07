<%-- 
    Document   : list_branch
    Created on : 1 thg 9, 2023, 15:31:32
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="container">
    <h1 class="text-center text-info mt-1">DANH SÁCH CHI NHÁNH</h1>
    <a href="<c:url value="/branch" />" class="btn btn-info">Thêm chi nhánh</a>

    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="<c:url value="list_branch" />">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="list_branch" var="pageUrl">
                        <c:param name="page" value="${i}"></c:param>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>

    <table class="table table-hover">
        <thead>
            <tr>
                <th></th>
                <th>ID</th>
                <th>Tên chi nhánh</th>
                <th>Địa chỉ</th>
                <th>SDT</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${branch}" var="b">
                <tr>
                    <td>
                        <img src="${b.image}" alt="${b.branchName}" width="120" />
                    </td>
                    <td>${b.branchID}</td>
                    <td>${b.branchName}</td>
                    <td>${b.address}</td>
                    <td>${b.phoneNumber}</td>
                    <td>
                        <a href="<c:url value='/branch/${b.branchID}' />" class="btn btn-success">Cập nhật</a>
                        <a href="<c:url value='/branch/delete/${b.branchID}' />" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>

                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>