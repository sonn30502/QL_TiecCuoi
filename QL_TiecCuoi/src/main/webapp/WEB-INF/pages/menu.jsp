<%-- 
    Document   : menu
    Created on : 23 thg 8, 2023, 09:52:18
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-info mt-1">QUẢN LÝ MENU</h1>

<c:url value="/menu" var="action" />
<form:form method="post" action="${action}" modelAttribute="menu" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="menuID" />
    <form:hidden path="image" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" 
                    path="menuName" id="menuName" placeholder="Tên menu..." />
        <label for="menuName">Tên menu</label>
        <form:errors path="menuName" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating">
        <form:textarea class="form-control" id="des" name="text" 
                       path="description" placeholder="Mô tả"></form:textarea>
            <label for="des">Mô tả</label>
        <form:errors path="description" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" 
                    path="price" id="price" placeholder="Nhập giá..." />
        <label for="price">Giá</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="branch" name="branch" path="branchID">
            <c:forEach items="${branchList}" var="b">
                <c:choose>
                    <c:when test="${b.branchID == menu.branchID.branchID}">
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
        <c:if test="${menu.image != null}">
            <img src="${menu.image}" width="120" />
        </c:if>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info" type="submit">
            <c:choose>
                <c:when test="${menu.menuID == null}">Thêm menu</c:when>
                <c:otherwise>Cập nhật menu</c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>

