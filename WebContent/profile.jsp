<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
<!DOCTYPE html>
<<c:if test="${empty user_email}">
    <c:set scope="session" var="not_logged_in" value="t"/>
    <c:redirect url="index.jsp"/>
</c:if>
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
    
    <h1></h1>
    <n3c:registration email="${user_email}">
        <h1>Account Request Queued for Email: <n3c:registrationEmail/></h1>
        Official First Name: <n3c:registrationOfficialFirstName /><br/>
        Official Last Name: <n3c:registrationOfficialLastName /><br/>
        First Name: <n3c:registrationFirstName /><br/>
        Last Name: <n3c:registrationLastName /><br/>
        Institution: <n3c:registrationInstitution /><br/>
    </n3c:registration>
    </div>
<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
