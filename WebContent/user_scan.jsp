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
        insert into n3c_admin.registration_remap values(?,?)
        <sql:param>${param.institution}</sql:param>
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
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C User Scan
		</h2>
		
        <form name="incommon" method='POST' action='user_scan.jsp' >
            <input type="radio" id="column" name="column" value="email" <c:if test="${param.column=='email'}">checked</c:if> > <label for="email">Email</label>&nbsp;&nbsp;&nbsp;
            <input type="radio" id="column" name="column" value="last_name" <c:if test="${empty param.column or param.column=='last_name'}">checked</c:if> > <label for="last_name">Last Name</label><br>
            <c:set var="ror_pattern" value="${param.ror_pattern}"/>
            <div class="form-group row">
                <label for="pattern" class="required col-sm-2 col-form-label">Pattern</label>
                <style>.required:after { content:" *"; color: red; } </style>
                <div class="col-sm-10">
                    <input name="pattern" type="text" size="20" class="form-control" id="pattern" value="${param.pattern}">
                </div>
            </div>
            <div style="text-align:left;">
                <button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
            </div>
            <input type="hidden" name="institution" value="${param.institution}">
        </form>
        <c:if test="${not empty param.pattern }">
	 		<h3>palantir.n3c_user</h3>
		    <sql:query var="categories" dataSource="jdbc/N3CLoginTagLib">
		        select email,first_name,last_name,ror_id,ror_name,una_path,created
		        from palantir.n3c_user
		        where ${param.column} ~ ? order by created desc;
		        <sql:param>${param.pattern}</sql:param>
		    </sql:query>
		    <table class="table table-hover">
		    <thead><tr><th>Email</th><th>First Name</th><th>Last Name</th><th>ROR ID</th><th>ROR Name</th><th>UNA Path</th><th>Created</th></tr></thead>
		    <tbody>
		    <c:forEach items="${categories.rows}" var="row" varStatus="rowCounter">
		        <tr><td>${row.email}</td><td>${row.first_name}</td><td>${row.last_name}</td><td>${row.ror_id}</td><td>${row.ror_name}</td><td>${row.una_path}</td><td>${row.created}</td></tr>
		    </c:forEach>
		    </tbody>
		    </table>

	 		<h3>n3c_admin.registration</h3>
		    <sql:query var="registration" dataSource="jdbc/N3CLoginTagLib">
		        select email,first_name,last_name,institution,official_full_name,official_institution,created,enclave
		        from n3c_admin.registration
		        where ${param.column} ~ ? order by created desc;
		        <sql:param>${param.pattern}</sql:param>
		    </sql:query>
		    <table class="table table-hover">
		    <thead><tr><th>Email</th><th>First Name</th><th>Last Name</th><th>Institution</th><th>Official Full Name</th><th>Official Institution</th><th>Created</th><th>Enclave</th></tr></thead>
		    <tbody>
		    <c:forEach items="${registration.rows}" var="row" varStatus="rowCounter">
		        <tr><td>${row.email}</td><td>${row.first_name}</td><td>${row.last_name}</td><td>${row.institution}</td><td>${row.official_full_name}</td><td>${row.official_institution}</td><td>${row.created}</td><td>${row.enclave}</td></tr>
		    </c:forEach>
		    </tbody>
		    </table>
        </c:if>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
