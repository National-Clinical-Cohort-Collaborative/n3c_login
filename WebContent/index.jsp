<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
	 <title>N3C Login/Registration</title>
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	 <link rel="stylesheet" id='font-awesome' href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

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
    	<h2 class="header-text"><img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Login/Registration Test Harness</h2>
    	<div>
 Welcome!  Thank you for your interest in the CD2H program and N3C initiative.  
 
Please register your profile information on the following page.  After the profile page, please follow the onboarding instructions to request access to the N3C Team Drive, Workstream and/or Subgroup specific mailing lists, N3C calendar, Slack, and GitHub.  
 
Applications for membership will be reviewed/approved rapidly during the week, but may extend up to 48 hours over weekends.  Your patience and understanding is appreciated. 
 
You will also receive a copy of your responses and you are encouraged to update your responses as needed.  Contact data2health@gmail.com with any questions. 
 
Please note the form has recently been updated; please review your prior responses to assure accuracy as the order of questions has changed.     		<c:if test="${not empty not_logged_in}">
    	  		Our apologies, but you must successfully log in through NIH prior to registering.<br/>
    	   	<c:remove var="not_logged_in"/>
    		</c:if>
        	<a href="dologin.jsp" class="btn btn-n3c">N3C Registration</a>
        	This will be the normal entry point, routing to the UNA login and then back to the form.
        	<br/><br/>
			<a href="dologin.jsp?attrs=1" class="btn btn-n3c">Login and access to attrs.jsp page </a>
			This is the NCATS UNA demo connection. It's here for the moment to support login debugging.
			<br/><br/>
        </div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
