<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
<%@ taglib prefix="mail" uri="http://slis.uiowa.edu/mailtaglib"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

	<sql:query var="users" dataSource="jdbc/N3CLoginTagLib">
		select email_address,first_name,last_name from n3c_admin.analytics_edu where email_address not in (select email from n3c_admin.registration) and email_address not in (select email_address from n3c_admin.analytics_sent)
		union 
		select email_address,first_name,last_name from n3c_admin.analytics_org where email_address not in (select email from n3c_admin.registration) and email_address not in (select email_address from n3c_admin.analytics_sent);
	</sql:query>
	<c:forEach items="${users.rows}" var="row" varStatus="rowCounter">
			<mail:message host="gmail">
				<mail:fromAddress address="noreply@ctsa.io" name="The NC3 Team" />
				<mail:recipientAddress address="${row.email_address}" name="${row.first_name} ${row.last_name}" />
                <mail:bccAddress address="david-eichmann@uiowa.edu"/>
				<mail:subject>N3C Data Enclave Palantir Training Account Registration Instructions</mail:subject>
				<mail:htmlBody>
<p>Dear N3C members:</p>
 
<p>We are excited to begin research in the N3C Data Enclave for COVID-19!</p>
 
<p>As a reminder, <b>please note:</b> N3C members who previously had accounts for accessing Palantir training will have to <b>re-register</b> for a new N3C Data Enclave account
to be able to submit a <a href="https://ncats.nih.gov/n3c/resources/data-access">Data Use Request (DUR)</a> form and gain access to the data. An executed
<a href="https://ncats.nih.gov/n3c/resources/data-access">Data Use Agreement (DUA)</a> is required before you can register and gain access to the data.</p>
 
<p>Once you - or your institution - have completed the DUA, please go to the <a href="https://covid.cd2h.org/N3C_data_enclave">N3C Data Enclave Access</a> web page on the N3C website and follow the steps
for "<b>First Time Users</b>."  On the Registration form, select the option for "<b>N3C Enclave Access</b>." (This was not previously available to you with your original training account.)</p>
 
<p>Please allow 48 hours to receive account notification. Once account notification has been received, you should be able to submit a Data Use Request (DUR) form.</p>
 
<p>Thank you for your collaboration in this important endeavor.</p>
 
<p>Sincerely,<br>
The National COVID Cohort Collaborative (N3C)</p>
				</mail:htmlBody>
			</mail:message>
	</c:forEach>
