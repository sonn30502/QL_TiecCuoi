<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
    /* Tùy chỉnh màu sắc cho nút "Xóa" và "Cập nhật" */
    .btn-update {
        background-color: #28a745; /* Màu xanh lá cây */
        color: #fff; /* Màu chữ trắng */
    }

    .btn-delete {
        background-color: #dc3545; /* Màu đỏ */
        color: #fff; /* Màu chữ trắng */
    }

    /* Đảm bảo nút "Xóa" và "Cập nhật" căn giữa */
    .btn-update,
    .btn-delete {
        display: inline-block;
        vertical-align: middle;
    }
</style>

<div class="container">
    <h1 class="text-center text-info mt-4">DANH SÁCH TIỆC CƯỚI</h1>
    <a href="<c:url value='/event' />" class="btn btn-update">Thêm tiệc cưới</a>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-2">
            <li class="page-item"><a class="page-link" href="<c:url value='/list_event' />">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value='/list_event' var="pageUrl">
                        <c:param name="page" value="${i}" />
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <table class="table table-hover mt-4">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Tên event</th>
                <th>Giá</th>
                <th>Status</th>
                <th>Sảnh cưới</th>
                <th>Thực đơn</th>
                <th>Dịch vụ</th>
                <th>Chi nhánh</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${event}" var="e">
                <tr>
                    <td>${e.eventID}</td>
                    <td>${e.eventName}</td>
                    <td>${e.totalPrice}</td>
                    <td>${e.status}</td>
                    <td>${e.hallID.hallName}</td>
                    <td>${e.menuID.menuName}</td>
                    <td>${e.serviceID.serviceName}</td>
                    <td>${e.branchID.branchName}</td>
                    <td>
                        <a href="<c:url value='/event/${e.eventID}' />" class="btn btn-update">Cập nhật</a>
                        <a href="<c:url value='/event/delete/${e.eventID}' />" class="btn btn-delete" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

