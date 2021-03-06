<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Fictional Library</title>

    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<h1>You have found the secret entrance to the fictional library</h1>

<h3>This place that does not exist</h3>
<sec:authorize access="hasAuthority('ROLE_ADMIN')">
    <h1><a href="/createbook" type="button">Create a new book</a></h1>
    <h1><a href="/list" type="button">See books created or updated by me</a></h1>
</sec:authorize>

<sec:authorize access="hasAuthority('ROLE_USER')">
    <h1><a href="/list" type="button">See all the books in the library</a></h1>
    <h1><a href="/checkouts" type="button">See all my checkouts</a></h1>
</sec:authorize>

<h3><a href="/login">Or does it? (Log In)</a></h3>
<h3><a href="/register">Find out yourself. (Register)</a></h3>

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<sec:authorize access="isAuthenticated()">
    <form name="f" action='<c:url value="/logout" />' method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input name="submit" type="submit" value="Logout" />
    </form>
</sec:authorize>

</body>
</html>