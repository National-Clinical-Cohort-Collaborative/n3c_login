<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>

<n3c:registration email="${user_email}">
	<n3c:registrationOfficialFirstName
		officialFirstName="${param.official_first_name}" />
	<n3c:registrationOfficialLastName
		officialLastName="${param.official_last_name}" />
	<n3c:registrationFirstName firstName="${param.first_name}" />
	<n3c:registrationLastName lastName="${param.last_name}" />
	<n3c:registrationInstitution institution="${param.institution}" />
	<n3c:registrationOrcidId orcidId="${param.orcid}" />
	<n3c:registrationGsuiteEmail gsuiteEmail="${param.gsuite}" />
	<n3c:registrationSlackId slackId="${param.slack}" />
	<n3c:registrationGithubId githubId="${param.github}" />
	<n3c:registrationTwitterId twitterId="${param.twitter}" />
	<n3c:registrationExpertise expertise="${param.expertise}" />
	<n3c:registrationTherapeuticArea therapeuticArea="${param.therapeutic}" />
	<n3c:registrationAssistantEmail assistantEmail="${param.assistant}" />
	<n3c:registrationEnclave enclave="${not empty param.enclave}"/>
    <n3c:registrationWorkstreams workstreams="${not empty param.workstreams}"/>
	<n3c:registrationUpdatedToNow />
</n3c:registration>

	<c:if test="${not empty param.analytics}">
		<n3c:membership email="${user_email}" label="analytics">
			<n3c:membershipJoinedToNow />
		</n3c:membership>
	</c:if>
	<c:if test="${not empty param.governance}">
		<n3c:membership email="${user_email}" label="governance">
			<n3c:membershipJoinedToNow />
		</n3c:membership>
	</c:if>
	<c:if test="${not empty param.phenotype}">
		<n3c:membership email="${user_email}" label="phenotype">
			<n3c:membershipJoinedToNow />
		</n3c:membership>
	</c:if>
	<c:if test="${not empty param.harmonization}">
		<n3c:membership email="${user_email}" label="harmonization">
			<n3c:membershipJoinedToNow />
		</n3c:membership>
	</c:if>
	<c:if test="${not empty param.synthetic}">
		<n3c:membership email="${user_email}" label="synthetic">
			<n3c:membershipJoinedToNow />
		</n3c:membership>
	</c:if>

<c:redirect url="profile.jsp" />
