<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

    <sql:update dataSource="jdbc/registration">
        insert into n3c_admin.registration(email,official_first_name,official_last_name,first_name,last_name,institution,created) values(?,?,?,?,?,?,now())
        <sql:param>${user_email}</sql:param>
        <sql:param>${param.official_first_name}</sql:param>
        <sql:param>${param.official_last_name}</sql:param>
        <sql:param>${param.first_name}</sql:param>
        <sql:param>${param.last_name}</sql:param>
        <sql:param>${param.institution}</sql:param>
    </sql:update>

    <c:redirect url="profile.jsp"/>
