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
	
	<c:if test="${not empty not_logged_in}">
		<div class=" n3c_alert">
    		<i class="fa fa-exclamation" aria-hidden="true">&emsp;</i>Our apologies, but you must successfully log in through NIH prior to registering. Click <a href="dologin.jsp">here</a> to be redirected.<br/>
    	</div>
    	<c:remove var="not_logged_in"/>
    </c:if>


	<div class="container center-box shadow-border">
    	<h2 class="header-text"><img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Login/Registration</h2>
    	<div style="text-align:center;">
			<h4 style="margin-bottom:30px;">Welcome!  Thank you for your interest in the CD2H program and N3C initiative.</h4>
 			
    		
			<p>Please register your profile information on the following page.  After submitting your information, please follow the <a href="https://covid.cd2h.org/onboarding_instructions" target="_blank">onboarding instructions</a>
			to request access to the N3C Team Drive, Workstream and/or Subgroup specific mailing lists, N3C calendar, Slack, and GitHub.</p>
 
 			<p>You will receive a copy of your responses and are encouraged to update your information as needed.</p>
 			
			<p class="n3c_alert" style="margin-bottom:0px">Please note the form has recently been updated; please review your prior responses to assure accuracy as the order of questions has changed.</p>
			
			
    		
        	<a href="dologin.jsp" class="btn btn-lg btn-n3c" style="margin-top:30px; margin-bottom:30px;">Click here to Register with N3C</a>
        	
			
			
			<p style="font-size:15px; font-style:italic; margin-bottom:30px; color:#6d6d6d">Applications for membership will be reviewed/approved rapidly during the week, but may extend up to 48 hours over weekends. Your patience and understanding is appreciated.</p>
			
			<p>Contact <a href="mailto:data2health@gmail.com">data2health@gmail.com</a> with any questions.</p>
			<a href="dologin.jsp?attrs=1" class="btn btn-n3c">NCATS UNA demo login</a> This is here for the moment to support login debugging.
        </div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
