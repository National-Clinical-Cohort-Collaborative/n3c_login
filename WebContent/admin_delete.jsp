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
<jsp:include page="head.jsp" flush="true" />

<style type="text/css" media="all">
@import "resources/n3c_login_style.css";
</style>

<body>

	<jsp:include page="navbar.jsp" flush="true" />

	<div class="container center-box shadow-border">
		<h2 class="header-text">
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C
			Registration Admin
		</h2>

		<h3>User Category Summary</h3>
		<sql:query var="candidates" dataSource="jdbc/N3CLoginTagLib">
	        select last_name,first_name,count(*) from n3c_admin.registration where last_name != '' group by 1,2 having count(*)>1 order by 1,2;
	    </sql:query>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Count</th>
				</tr>
			</thead>
			<c:forEach items="${candidates.rows}" var="row"
				varStatus="rowCounter">
				<tr>
					<td>${row.last_name}, ${row.first_name}</td>
					<td>
						<sql:query var="registrations" dataSource="jdbc/N3CLoginTagLib">
							select email,orcid_id,created from n3c_admin.registration where last_name = ? and first_name = ?;
							<sql:param>${row.last_name }</sql:param>
							<sql:param>${row.first_name }</sql:param>
						</sql:query>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>n3c_admin.registration Email</th>
									<th>ORCiD</th>
									<th>Created</th>
								</tr>
							</thead>
							<c:forEach items="${registrations.rows}" var="row2"
								varStatus="rowCounter2">
								<tr><td><a href="submit_deletion.jsp?email=${row2.email}">${row2.email}</a></td><td>${row2.orcid_id}</td><td>${row2.created}</td></tr>
							</c:forEach>
						<sql:query var="registrations" dataSource="jdbc/N3CLoginTagLib">
							select email,orcid_id,created from palantir.n3c_user where last_name = ? and first_name = ?;
							<sql:param>${row.last_name }</sql:param>
							<sql:param>${row.first_name }</sql:param>
						</sql:query>
							<thead>
								<tr>
									<th>palantir.n3c_user Email</th>
									<th>ORCiD</th>
									<th>Created</th>
								</tr>
							</thead>
							<c:forEach items="${registrations.rows}" var="row2"
								varStatus="rowCounter2">
								<tr><td>${row2.email}</td><td>${row2.orcid_id}</td><td>${row2.created}</td></tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
