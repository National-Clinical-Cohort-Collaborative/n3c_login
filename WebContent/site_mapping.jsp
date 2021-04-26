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
		
        <form name="incommon" method='POST' action='submit_link.jsp' >
            	<button type="submit" name="action" value="submit">Submit</button>
		<div class="row">
			<div class="col-sm-12 col-md-4" id="registration_metrics">
	 		<h3>Site Status</h3>
		    <sql:query var="abbrevs" dataSource="jdbc/N3CLoginTagLib">
		        select abbreviation,released
		        from n3c_admin.site_status_for_export
		        where abbreviation not in (select abbreviation from n3c_admin.site_mapping)
		        order by 1;
		    </sql:query>
		    <table class="table table-hover">
		    <thead><tr><th>select?</th><th>Abbreviation</th><th>Released?</th></tr></thead>
		    <tbody>
		    <c:forEach items="${abbrevs.rows}" var="row" varStatus="rowCounter">
		        <tr>							<td><input type="radio" id="site" name="site" value="${row.abbreviation}"></td>
		        <td>${row.abbreviation}</td><td>${row.released}</td></tr>
		    </c:forEach>
		    </tbody>
		    </table>

		</div>
			<div class="col-sm-12 col-md-8" id="registration_metrics">
	 		<h3>DTA Master</h3>
		    <sql:query var="rors" dataSource="jdbc/N3CLoginTagLib">
		        select institutionid as ror, institutionname as name
		        from n3c_admin.dta_master
		        where institutionid not in (select ror from n3c_admin.site_mapping)
		        and dtaexecuted is not null
		        order by 2;
		    </sql:query>
		    <table class="table table-hover">
		    <thead><tr><th>select?</th><th>ROR ID</th><th>Institution Name</th></tr>
		    <tbody>
		    <c:forEach items="${rors.rows}" var="row" varStatus="rowCounter">
		        <tr>							<td><input type="radio" id="ror" name="ror" value="${row.ror}"></td>
		        <td>${row.ror}</td><td>${row.name}</td></tr>
		    </c:forEach>
		    </tbody>
		    </table>
		</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
