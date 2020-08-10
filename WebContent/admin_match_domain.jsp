<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>

<c:if test="${empty user_email}">
	<c:set scope="session" var="not_logged_in" value="t" />
	<c:redirect url="index.jsp" />
</c:if>
<c:if test="${not empty param.save}">
    <sql:update dataSource="jdbc/N3CLoginTagLib">
        insert into n3c_admin.registration_domain_remap values(?,?)
        <sql:param>${param.domain}</sql:param>
        <sql:param>${param.save}</sql:param>
    </sql:update>
    <c:redirect url="admin.jsp" />
</c:if>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>N3C Registration Admin Match</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" id='font-awesome'
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
       <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
       <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
     <![endif]-->
</head>

<style type="text/css" media="all">
@import "resources/n3c_login_style.css";
</style>

<body>

	<jsp:include page="navbar.jsp" flush="true" />
	
	<div class="container center-box shadow-border">
		<h2 class="header-text">
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Registration Admin Match to Email Domain
		</h2>
		
        <form name="incommon" method='POST' action='admin_match_domain.jsp' autocomplete="off" onsubmit="return validateForm()" >
            <c:set var="ror_pattern" value="${param.ror_pattern}"/>
            <div class="form-group row">
                <label for="ror_query" class="required col-sm-2 col-form-label">ROR query</label>
                <style>.required:after { content:" *"; color: red; } </style>
                <div class="col-sm-10">
                    <input name="ror_pattern" type="text" class="form-control" id="ror_pattern" value="${ror_pattern}">
                </div>
            </div>
            <div style="text-align:left;">
                <button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
            </div>
            <input type="hidden" name="domain" value="${param.domain}">
        </form>
		<h3>ROR Organizations</h3>
	    <sql:query var="categories" dataSource="jdbc/N3CLoginTagLib">
	        select id,name,country_name
	        from ror.organization where name ~ ? order by name
	        <sql:param>${ror_pattern}</sql:param>
	    </sql:query>
	    <table>
	    <tr><th>ID</th><th>Name</th><th>Country</th></tr>
	    <c:forEach items="${categories.rows}" var="row" varStatus="rowCounter">
	        <tr><td>${row.id}</td><td><a href="admin_match_domain.jsp?domain=${param.domain}&save=${row.id}">${row.name}</a></td><td>${row.country_name}</td></tr>
	    </c:forEach>
	    </table>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
