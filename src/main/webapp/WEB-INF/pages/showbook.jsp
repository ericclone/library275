<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Details</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>Book Details</h1>
   <table>
    <tr>
        <td>Book ID</td>
        <td>${book.id}</td>
    </tr>
    <tr>
        <td>ISBN</td>
        <td>${book.isbn}</td>
    </tr>
    <tr>
        <td>Author</td>
        <td>${book.author}</td>
    </tr>
    <tr>
        <td>Title</td>
        <td>${book.title}</td>
    </tr>
    <tr>
        <td>Call Number</td>
        <td>${book.callNumber}</td>
    </tr>
    <tr>
        <td>Publisher</td>
        <td>${book.publisher}</td>
    </tr>
    <tr>
        <td>Year of Publication</td>
        <td>${book.year}</td>
    </tr>
    <tr>
        <td>Location in Library</td>
        <td>${book.location}</td>
    </tr>
    <tr>
        <td>Number of Copies</td>
        <td>${book.numberOfCopies}</td>
    </tr>
    <tr>
        <td>Current Status</td>
        <td>${book.status}</td>
    </tr>
    <tr>
        <td>Keywords</td>
        <td>${book.keywords}</td>
    </tr>
    <c:if test="${not empty book.coverUrl}">
    <tr>
       <td colspan="2"><img src="${book.coverUrl}" width="200"></td>
    </tr>
    </c:if>
   </table>

<sec:authorize access="hasAuthority('ROLE_ADMIN')">
    <a href="/update/${book.id}" type="button">Update</a>
    <a href="/delete/${book.id}" type="button" onclick="return confirm('Deleting a book cannot be undone. Are you sure?')">Delete</a>
</sec:authorize>
</body>
</html>