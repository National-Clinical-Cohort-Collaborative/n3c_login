<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update dataSource="jdbc/N3CLoginTagLib">
    insert into n3c_admin.registration_domain_remap values(substring(? from '@(.*)$'),?)
    <sql:param>${param.email}</sql:param>
	<sql:param>${param.ror}</sql:param>
</sql:update>
<c:redirect url="admin_map_email.jsp" />
