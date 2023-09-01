<%-- 
    Document   : index
    Created on : 17 thg 8, 2023, 21:48:29
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1 class="text-center text-danger">TRANG CHỦ</h1>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="container">
    <h1 class="text-center text-info mt-1">DANH SÁCH MENU</h1>
    <a href="<c:url value="/menu" />" class="btn btn-info">Thêm món</a>

    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="<c:url value="/" />">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/" var="pageUrl">
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
                <th>Tên món</th>
                <th>Giá</th>
                <th>Chi nhánh</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${menu}" var="m">
                <tr>
                    <td>
                        <img src="${m.image}" alt="${m.menuName}" width="120" />
                    </td>
                    <td>${m.menuID}</td>
                    <td>${m.menuName}</td>
                    <td>${m.price}</td>
                    <td>${m.branchID.branchName}</td>

                    <td>
                        <a href="<c:url value='/menu/${m.menuID}' />" class="btn btn-success">Cập nhật</a>
                        <a href="<c:url value='/menu/delete/${m.menuID}' />" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>

                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>