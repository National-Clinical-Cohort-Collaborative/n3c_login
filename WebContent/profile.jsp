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

	<jsp:include page="navbar.jsp" flush="true" />
	
	<div class="container center-box shadow-border">
		<h2 class="header-text">
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Registration
		</h2>

		<n3c:registration email="${user_email}">
			<div class="mb-3" style="text-align:center;">
				<h3>N3C Profile for: <n3c:registrationEmail /></h3>
				<small>Created: <n3c:registrationCreated /> &emsp; Updated: <n3c:registrationUpdated /></small>
			</div>
			<div class="container">
				<div class="row mb-4">
					<div class="col-md-6">
						<strong>Official First Name:</strong> <n3c:registrationOfficialFirstName /><br>
						<strong>Official Last Name:</strong> <n3c:registrationOfficialLastName /><br>
						<strong>Official Full Name:</strong> <n3c:registrationOfficialFullName /><br>
						<strong>First Name:</strong> <n3c:registrationFirstName /><br>
						<strong>Last Name:</strong> <n3c:registrationLastName />
					</div>
					<div class="col-md-6">
						<strong>Institution:</strong> <n3c:registrationInstitution /><br>
						<strong>ORCiD ID:</strong> <n3c:registrationOrcidId /><br>
						<strong>Expertise:</strong> <n3c:registrationExpertise /><br>
						<strong>Therapeutic Area:</strong> <n3c:registrationTherapeuticArea />
						
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-6">
						<strong>GSuite Email:</strong> <n3c:registrationGsuiteEmail /><br>
						<strong>Assistant's Email:</strong> <n3c:registrationAssistantEmail />
					</div>
					<div class="col-md-6">
						<strong>Slack ID:</strong> <n3c:registrationSlackId /><br>
						<strong>GitHub ID:</strong> <n3c:registrationGithubId /><br>
						<strong>Twitter ID:</strong> <n3c:registrationTwitterId />
					</div>
				</div>
			</div>

           <c:if test="${n3c:registrationEnclaveValue()}">
                 <p>Access to the N3C Enclave has been requested.</p>
            </c:if>
            
			<c:if test="${n3c:registrationWorkstreamsValue()}">
			     <p>Membership in the N3C workstreams has been requested.</p>
				<h4 class="accent-text">Workstream Memberships</h4>
				<div class="row">
					<n3c:foreachMembership var="x">
						<n3c:membership>
							<div class="col-md-6 mb-3">
								Workstream: <n3c:membershipLabel /><br>
								<small>Joined: <n3c:membershipJoined /></small>
							</div>
						</n3c:membership>
					</n3c:foreachMembership>
				</div>
			</c:if>
 
            <div class="container" style="text-align:center;">
                <div class="row mb-4 justify-content-center">
                    <div class="col-md-4">
                        <a href="register.jsp">Edit This Profile</a>
                    </div>
                </div>
            </div>
        
 		</n3c:registration>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
