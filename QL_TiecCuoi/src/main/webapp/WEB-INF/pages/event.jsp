<%-- 
    Document   : event
    Created on : 2 thg 9, 2023, 16:17:58
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">QUẢN LÝ EVENT</h1>

<c:url value="/event" var="action" />
<form:form method="post" action="${action}" modelAttribute="event">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="eventID" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" 
                    path="eventName" id="eventName" placeholder="Tên event..." />
        <label for="eventName">Tên event</label>
        <form:errors path="eventName" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" 
                    path="totalPrice" id="totalPrice" placeholder="Nhập giá..." />
        <label for="totalPrice">Giá</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" 
                    path="status" id="status" placeholder="Nhập status..." />
        <label for="status">status</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="branch" name="branch" path="branchID">
            <c:forEach items="${branchList}" var="b">
                <c:choose>
                    <c:when test="${b.branchID == event.branchID.branchID}">
                        <option value="${b.branchID}" selected>${b.branchName}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${b.branchID}">${b.branchName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="branch" class="form-label">Chi nhánh:</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="halls" name="halls" path="hallID">
            <c:forEach items="${hallList}" var="h">
                <c:choose>
                    <c:when test="${h.hallID == event.hallID.hallID}">
                        <option value="${h.hallID}" selected>${h.hallName}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${h.hallID}">${h.hallName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="halls" class="form-label">Sảnh cưới</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="menu" name="menu" path="menuID">
            <c:forEach items="${menuList}" var="m">
                <c:choose>
                    <c:when test="${m.menuID == event.menuID.menuID}">
                        <option value="${m.menuID}" selected>${m.menuName}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${m.menuID}">${m.menuName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="menu" class="form-label">Thực đơn</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="service" name="service" path="serviceID">
            <c:forEach items="${dvList}" var="s">
                <c:choose>
                    <c:when test="${s.serviceID == event.serviceID.serviceID}">
                        <option value="${s.serviceID}" selected>${s.serviceName}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${s.serviceID}">${s.serviceName}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="service" class="form-label">Dịch vụ</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info" type="submit">
            <c:choose>
                <c:when test="${event.eventID == null}">Thêm event</c:when>
                <c:otherwise>Cập nhật event</c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>