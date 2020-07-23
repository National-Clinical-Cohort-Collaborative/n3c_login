<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>

    <c:set var="user_email" scope="session" value="david-eichmann@uiowa.edu"/>
    
    <c:if test="${n3c:registrationExists(user_email)}">
        <c:redirect url="profile.jsp"/>
    </c:if>

    <n3c:registration email="david-eichmann@uiowa.edu">
        <n3c:registrationOfficialFirstName officialFirstName="David"/>
        <n3c:registrationOfficialLastName officialLastName="Eichmann"/>
        <n3c:registrationOfficialFullName officialFullName="Eichmann, David"/>
        <n3c:registrationFirstName firstName="David"/>
        <n3c:registrationLastName lastName="Eichmann"/>
        <n3c:registrationInstitution  institution="University of Iowa"/>
        <n3c:registrationCreatedToNow/>
        <n3c:registrationUpdatedToNow/>
    </n3c:registration>
    
    <c:redirect url="register.jsp"/>
