<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>N3C Registration Admin</title>
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
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Registration Dashboard
		</h2>
		
		<div class="container center-box" id=others style="float: left; width: 45%">
		<h3>Registration Summary</h3>
	    <table class="table table-hover">
	    <thead>
	    <tr><th>Institutions / DUAs</th><th>Count</th></tr>
	    </thead>
	    <sql:query var="duas" dataSource="jdbc/N3CLoginTagLib">
	        select count(*) from n3c_admin.dua_master;
	    </sql:query>
	    <c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
	        <tr><td>Institutions with Executed DUAs</td><td align=right>${row.count}</td></tr>
	    </c:forEach>
	    <sql:query var="duas" dataSource="jdbc/N3CLoginTagLib">
	        select count(*) from n3c_admin.dua_master where institutionid in (select ror_id from n3c_admin.gsuite_view );
	    </sql:query>
	    <c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
	        <tr><td>DUA Institutions with Registered Users</td><td align=right>${row.count}</td></tr>
	    </c:forEach>
	    </table>

	    <table class="table table-hover">
	    <thead>
	    <tr><th>User Registrations</th><th>Count</th></tr>
	    </thead>
	    <sql:query var="duas" dataSource="jdbc/N3CLoginTagLib">
	        select count(*) from n3c_admin.registration;
	    </sql:query>
	    <c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
	        <tr><td>Total User Registrations</td><td align=right>${row.count}</td></tr>
	    </c:forEach>
	    <sql:query var="duas" dataSource="jdbc/N3CLoginTagLib">
	        select count(*) from n3c_admin.registration where enclave;
	    </sql:query>
	    <c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
	        <tr><td>Users Requesting Enclave Access</td><td align=right>${row.count}</td></tr>
	    </c:forEach>
	    <sql:query var="duas" dataSource="jdbc/N3CLoginTagLib">
	        select count(*) from palantir.n3c_user;
	    </sql:query>
	    <c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
	        <tr><td>Registered Enclave Users From DUA Institutions</td><td align=right>${row.count}</td></tr>
	    </c:forEach>
	    </table>
	</div>
		<div class="container center-box" id=others style="float: left; width: 10%">
	</div>
		<div class="container center-box" id=others style="float: left; width: 45%">
		<h3>By Date</h3>
	    <table class="table table-hover">
	    <thead>
	    <tr><th>Date</th><th># DUAs Signed</th><th># Users Registered</th></tr>
	    </thead>
	    <sql:query var="duas" dataSource="jdbc/N3CLoginTagLib">
	        select * from
	           (select created::date as date,count(*) as registrations from n3c_admin.registration group by 1) as foo
	        natural full outer join
	           (select duaexecuted::date as date,count(*) as duas from n3c_admin.dua_master group by 1) as bar
	        order by 1 desc;
	    </sql:query>
	    <c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
	        <tr><td>${row.date}</td><td align=right>${row.duas}</td><td align=right>${row.registrations}</td></tr>
	    </c:forEach>
	    </table>
	    </div>
	</div>
	<div id=others style="float: left; width: 100%">
		<jsp:include page="footer.jsp" flush="true" />
		</div>
</body>
</html>
