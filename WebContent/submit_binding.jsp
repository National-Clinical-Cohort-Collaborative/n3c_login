<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update dataSource="jdbc/N3CLoginTagLib">
	update n3c_admin.enclave_project set task_team = ?::boolean where uid = ?
	<sql:param>${not empty param.domain}</sql:param>
	<sql:param>${param.uid}</sql:param>
</sql:update>

<sql:update dataSource="jdbc/N3CLoginTagLib">
	delete from n3c_admin.binding where email = ? and uid = ?
	<sql:param>${param.email}</sql:param>
	<sql:param>${param.uid}</sql:param>
</sql:update>

<c:forEach var="value" items="${paramValues.team}">
	<sql:update dataSource="jdbc/N3CLoginTagLib">
        insert into n3c_admin.binding values(?,?,?::int)
        <sql:param>${param.email}</sql:param>
		<sql:param>${param.uid}</sql:param>
		<sql:param>${value}</sql:param>
	</sql:update>
</c:forEach>
<c:redirect url="project_roster.jsp" />
