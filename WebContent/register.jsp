<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
    	<h1>N3C Registration</h1>
    	Email Address: ${user_email}<br/>
    	
    	<form method='POST' action='submit_registration.jsp'>
    	
            First Name: <input type="text" id="first_name" name="first_name" size="50" value="${user_first_name}"><br/>
            Last Name: <input type="text" id="last_name" name="last_name" size="50" value="${user_last_name}"><br/>
            Institution: <input type="text" id="institution" name="institution" size="100" value="${user_institution}"><br/>
            
            <input type="hidden" name="official_first_name" value="${user_first_name}">
            <input type="hidden" name="official_last_name" value="${user_last_name}">
            
            <button type="submit" name="action" value="submit">Submit</button>
    	</form>
	</div>
<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
