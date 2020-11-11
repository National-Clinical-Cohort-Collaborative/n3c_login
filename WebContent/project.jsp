<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />

<style type="text/css" media="all">
@import "resources/n3c_login_style.css";
</style>

<body>

	<jsp:include page="navbar.jsp" flush="true" />

	<c:if test="${not empty not_logged_in}">
		<div class=" n3c_alert">
			<i class="fa fa-exclamation" aria-hidden="true">&emsp;</i>Our
			apologies, but you must successfully log in through NIH prior to
			registering. Click <a href="dologin.jsp">here</a> to be redirected.<br />
		</div>
		<c:remove var="not_logged_in" />
	</c:if>


	<div class="container center-box shadow-border">
		<h2 class="header-text"><img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">Your Approved N3C Enclave Projects</h2>
		<n3c:registration email="chute@jhu.edu">
			<h3><n3c:registrationFirstName /> <n3c:registrationLastName /></h3>
			<n3c:foreachProject var="x">
				<n3c:project>
					<h4><n3c:projectTitle /></h4>
					<p><n3c:projectResearchStatement /></p>
                   <input style="width:16px; height:16px;" type="checkbox" id="domain" name="domain" value="domain" <c:if test="${n3c:projectDomainTeamValue()}">checked</c:if> > <label for="enclave" class="accent-text" style="font-size:20px; font-weight:500; padding-left:10px; margin-top:30px;">This is a domain team project.</label><br>
					<ul>
						<n3c:foreachDomainTeam var="y" sortCriteria="title">
							<n3c:domainTeam>
								<li><a href="https://covid.cd2h.org/node/<n3c:domainTeamNid/>"><n3c:domainTeamTitle /></a>
							</n3c:domainTeam>
						</n3c:foreachDomainTeam>
					</ul>
				</n3c:project>
			</n3c:foreachProject>
		</n3c:registration>
		<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>
</html>
