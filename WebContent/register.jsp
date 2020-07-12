<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${empty user_email}">
    <c:set scope="session" var="not_logged_in" value="t"/>
    <c:redirect url="index.jsp"/>
</c:if>
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
	<div class="container center-box shadow-border">
    	<h2 class="header-text"><img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Registration</h2>
    	
    	<form method='POST' action='submit_registration.jsp'>
  			<div class="form-group row">
    			<label for="email" class="col-sm-2 col-form-label">Email</label>
    			<div class="col-sm-10">
      				<input name="email" type="text" readonly class="form-control-plaintext" id="email" value="${user_email}">
    			</div>
  			</div>
  			<div class="form-group row">
    			<label for="first_name" class="col-sm-2 col-form-label">First Name</label>
    			<div class="col-sm-10">
      				<input name="first_name" type="text" class="form-control" id="first_name" value="${user_first_name}">
    			</div>
  			</div>
  			<div class="form-group row">
    			<label for="last_name" class="col-sm-2 col-form-label">Last Name</label>
    			<div class="col-sm-10">
      				<input name="last_name" type="text" class="form-control" id="last_name" value="${user_last_name}">
    			</div>
  			</div>
  			<div class="form-group row">
    			<label for="institution" class="col-sm-2 col-form-label">Institution</label>
    			<div class="col-sm-10">
      				<input name="institution" type="text" class="form-control" id="institution" value="${user_institution}">
    			</div>
  			</div>
    	
            
            <input type="hidden" name="official_first_name" value="${user_first_name}">
            <input type="hidden" name="official_last_name" value="${user_last_name}">
            
            <div style="text-align:right;">
            	<button class="btn btn-n3c" type="submit" name="action" value="submit">Submit</button>
            </div>
    	</form>
	</div>
<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
