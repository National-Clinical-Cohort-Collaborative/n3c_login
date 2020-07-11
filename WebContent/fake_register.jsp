<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <c:set var="user_email" scope="session" value="david-eichmann@uiowa.edu" />
    <c:set var="user_first_name" scope="session" value="David" />
    <c:set var="user_last_name" scope="session" value="Eichmann" />
    <c:set var="user_institution" scope="session" value="University of Iowa" />
    <c:redirect url="register.jsp"/>
