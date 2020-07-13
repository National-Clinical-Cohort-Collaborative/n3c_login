<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
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
<title>N3C Login/Registration</title>
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
	<div class="container center-box shadow-border">
		<h2 class="header-text">
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Registration
		</h2>

		<n3c:registration email="${user_email}">
			<h1>N3C Profile for: <n3c:registrationEmail /></h1>
            Official First Name: <n3c:registrationOfficialFirstName /><br />
            Official Last Name: <n3c:registrationOfficialLastName /><br />
            First Name: <n3c:registrationFirstName /><br />
            Last Name: <n3c:registrationLastName /><br />
            Institution: <n3c:registrationInstitution /><br />
            ORCiD ID: <n3c:registrationOrcidId /><br />
            GSuite Email: <n3c:registrationGsuiteEmail /><br />
            Slack ID: <n3c:registrationSlackId /><br />
            GitHub ID: <n3c:registrationGithubId /><br />
            Twitter ID: <n3c:registrationTwitterId /><br />
            Expertise: <n3c:registrationExpertise /><br />
            Therapeutic Area: <n3c:registrationTherapeuticArea /><br />
            Assistant's Email: <n3c:registrationAssistantEmail /><br />
            Created: <n3c:registrationCreated /><br />
            Updated: <n3c:registrationUpdated /><br />

			<br />
			<ul>
				<li><a href="register.jsp">Edit This Profile</a></li>
				<c:if test="${not n3c:enclaveExists(user_email)}"><li><a href="enclave.jsp">Request Access to the Enclave</a></li></c:if>
				<c:if test="${not n3c:registrationHasMembership(user_email)}"><li><a href="membership.jsp">Join N3C Workstreams</a></li></c:if>
			</ul>

			<c:if test="${n3c:enclaveExists(user_email)}">
				<h2>Enclave Access</h2>
				<n3c:enclave>
					<ul>
						<li>SFTP: <n3c:enclaveSftp />
						<li>Access Level: <n3c:enclaveLevel />
						<li>Requested: <n3c:enclaveRequested />
						<li>Approved: <n3c:enclaveApproved />
					</ul>
				</n3c:enclave>
			</c:if>
			<c:if test="${n3c:registrationHasMembership(user_email)}">
				<h2>Workstream Memberships</h2>
				<n3c:foreachMembership var="x">
					<n3c:membership>
						<ul>
							<li>Workstream: <n3c:membershipLabel />
							<li>Joined: <n3c:membershipJoined />
						</ul>
					</n3c:membership>
				</n3c:foreachMembership>
			</c:if>
		</n3c:registration>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
