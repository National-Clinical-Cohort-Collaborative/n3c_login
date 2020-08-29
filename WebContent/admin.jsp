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
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Registration Admin
		</h2>
		
		<h3>User Category Summary</h3>
	    <sql:query var="categories" dataSource="jdbc/N3CLoginTagLib">
	        select category,count
	        from n3c_admin.user_stats
	        order by 1;
	    </sql:query>
	    <table class="table table-hover">
	    <tr><th>Category</th><th>Count</th></tr>
	    <c:forEach items="${categories.rows}" var="row" varStatus="rowCounter">
	        <tr><td><a href="roster.jsp?category=${row.category}">${row.category}</a></td><td align=right>${row.count}</td></tr>
	    </c:forEach>
	    </table>

        <sql:query var="rors" dataSource="jdbc/N3CLoginTagLib">
            select case when official_institution='' then 'none' else official_institution end,count(*)
            from n3c_admin.registration
            where not exists (select * from ror.organization where name=official_institution)
              and official_institution not in ('NIH','login.gov')
              and not exists (select * from n3c_admin.registration_remap where official_institution=incommon)
            group by 1 order by 1;
        </sql:query>
        <c:forEach items="${rors.rows}" var="row" varStatus="rowCounter">
            <c:if test="${rowCounter.isFirst() }">
                <h3>ROR Institution Name Mismatches</h3>
                <ul>
            </c:if>
            <li><a href="admin_match_incommon.jsp?institution=${row.official_institution}">${row.official_institution}</a> (${row.count})
            <c:if test="${rowCounter.isLast() }">
                </ul>
            </c:if>
        </c:forEach>

        <sql:query var="rors" dataSource="jdbc/N3CLoginTagLib">
            select substring(email from '@(.*)') as domain, count(*)
            from n3c_admin.registration
            where official_institution='login.gov'
              and not exists (select * from n3c_admin.registration_domain_remap where email_domain=substring(email from '@(.*)'))
              and not exists (select * from n3c_admin.registration_domain_suppress where domain=substring(email from '@(.*)'))
            group by 1 order by 1;
        </sql:query>
        <c:forEach items="${rors.rows}" var="row" varStatus="rowCounter">
            <c:if test="${rowCounter.isFirst() }">
                <h3>Institutions not Federated with InCommon</h3>
                <ul>
            </c:if>
            <li><a href="admin_match_domain.jsp?domain=${row.domain}">${row.domain}</a> (${row.count})
            <c:if test="${rowCounter.isLast() }">
                </ul>
            </c:if>
        </c:forEach>

	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
