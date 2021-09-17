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
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C
			Email Domain to ROR Mapping
		</h2>

		<sql:query var="categories" dataSource="jdbc/N3CLoginTagLib">
	        select substring(email from '.*@(.*)') as email, official_institution, count(*), institutionid, institutionname
	        from n3c_admin.dua_master, n3c_admin.registration as foo
	        where enclave
	          and not exists (select orcid_id from palantir.n3c_user as bar where foo.orcid_id = bar.orcid_id)
	          and official_institution not in ('NIH','login.gov')
	          and substring(email from '.*@(.*)') = substring(duacontactemail from '.*@(.*)')
	          and substring(email from '.*@(.*)') not in ('gmail.com','yahoo.com')
	        group by 1,2,4,5 order by 3 desc;
	    </sql:query>
		<table>
			<tr>
				<th>Email</th>
				<th>Registration Institution</th>
				<th>Count</th>
				<th>DUA ROR</th>
				<th>DUA Institution</th>
			</tr>
			<c:forEach items="${categories.rows}" var="row"
				varStatus="rowCounter">
				<tr>
					<td><a href="submit_domain_remap.jsp?domain=${row.email}&ror=${row.institutionid}">${row.email}</a></td>
					<td>${row.official_institution}</td>
					<td>${row.count}</td>
					<td>${row.institutionid}</td>
					<td>${row.institutionname}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
