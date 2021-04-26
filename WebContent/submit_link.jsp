<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

		<sql:update dataSource="jdbc/N3CLoginTagLib">
		    insert into n3c_admin.site_mapping values(?,?)
		    <sql:param>${param.site}</sql:param>
			<sql:param>${param.ror}</sql:param>
		</sql:update>

<c:redirect url="site_mapping.jsp" />
