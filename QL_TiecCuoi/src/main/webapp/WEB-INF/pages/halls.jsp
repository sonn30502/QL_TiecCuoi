<%-- 
    Document   : halls
    Created on : 29 thg 8, 2023, 16:42:18
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-info mt-1">QUẢN LÝ SẢNH CƯỚI</h1>

<c:url value="/halls" var="action" />
<form:form method="post" action="${action}" modelAttribute="halls" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="hallID" />
    <form:hidden path="image" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" 
                    path="hallName" id="hallName" placeholder="Tên sảnh cưới..." />
        <label for="hallName">Tên sảnh cưới</label>
        <form:errors path="hallName" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating">
        <form:textarea class="form-control" id="des" name="text" 
                       path="description" placeholder="Mô tả"></form:textarea>
            <label for="des">Mô tả</label>
        <form:errors path="description" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" 
                    path="priceMorning" id="priceMorning" placeholder="Nhập giá sảnh sáng..." />
        <label for="price">Giá sảnh sáng</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" 
                    path="priceAfternoon" id="priceAfternoon" placeholder="Nhập giá sảnh chiều..." />
        <label for="price">Giá sảnh chiều</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" 
                    path="priceEvening" id="priceEvening" placeholder="Nhập giá sảnh tối..." />
        <label for="price">Giá sảnh tối</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" 
                    path="priceWeekend" id="priceWeekend" placeholder="Nhập giá sảnh cuối tuần..." />
        <label for="price">Giá sảnh cuối tuần</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="branch" name="branch" path="branchID">
            <c:forEach items="${branches}" var="b">
                <c:choose>
                    <c:when test="${b.branchID == halls.branchID.branchID}">
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
        <form:input type="file" class="form-control" 
                    path="file" id="file"  />
        <label for="file">Ảnh</label>
        <c:if test="${halls.image != null}">
            <img src="${halls.image}" width="120" />
        </c:if>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info" type="submit">
            <c:choose>
                <c:when test="${halls.hallID == null}">Thêm sảnh cưới</c:when>
                <c:otherwise>Cập nhật sảnh cưới</c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>