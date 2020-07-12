<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
	 <title>N3C Login/Registration</title>
	 <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

     <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
     <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
     <!--[if lt IE 9]>
       <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
       <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
     <![endif]-->
</head>
<body>
	<div class="container">
    	<h1>N3C Login/Registration Harness</h1>
    	<c:if test="${not empty not_logged_in}">
    	   Our apologies, but you must successfully log in through NIH prior to registering.<br/>
    	   <c:remove var="not_logged_in"/>
    	</c:if>
		<a href="dologin.jsp" class="btn btn-primary">Login</a>
		<a href="dologin.jsp?attrs=1" class="btn btn-primary">Login and access to attrs.jsp page </a>
		These are the NCATS UNA demo connections.  They's go away once we're federated with them.
		<br/><br/>
        <a href="register.jsp" class="btn btn-primary">N3C Registration</a>
        This will be the normal entry point, routing to the UNA login and then back to the form.
        <br/><br/>
        <a href="fake_register.jsp" class="btn btn-primary">N3C Registration (faked login for now)</a>
        This is just a mock up of a returned payload populating the form.
		
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
