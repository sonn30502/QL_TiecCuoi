<%-- 
    Document   : list_halls
    Created on : 30 thg 8, 2023, 16:24:20
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="container">
    <h1 class="text-center text-info mt-1">DANH SÁCH SẢNH CƯỚI</h1>
    <a href="<c:url value="/halls" />" class="btn btn-info">Thêm sảnh cưới</a>

    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="<c:url value="list_halls" />">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="list_halls" var="pageUrl">
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
                <th>Tên sảnh</th>
                <th>Giá sáng</th>
                <th>Giá trưa</th>
                <th>Giá tối</th>
                <th>Giá cuối tuần</th>
                <th>Chi nhánh</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${halls}" var="h">
                <tr>
                    <td>
                        <img src="${h.image}" alt="${h.hallName}" width="120" />
                    </td>
                    <td>${h.hallID}</td>
                    <td>${h.hallName}</td>
                    <td>${h.priceMorning}</td>
                    <td>${h.priceAfternoon}</td>
                    <td>${h.priceEvening}</td>
                    <td>${h.priceWeekend}</td>
                    <td>${h.branchID.branchName}</td>

                    <td>
                        <a href="<c:url value='/halls/${h.hallID}' />" class="btn btn-success">Cập nhật</a>
                        <a href="<c:url value='/halls/delete/${h.hallID}' />" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>

                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>