<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="vo" items="${list }">
	<li class="categoryNo"  value="${vo.categoryNo }">
		<a href="#">${vo.categoryNameL}</a>
	</li>
</c:forEach>