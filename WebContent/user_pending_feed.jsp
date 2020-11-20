<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="users" dataSource="jdbc/N3CLoginTagLib">
select jsonb_pretty(jsonb_agg(n3c_user))
from (select email,first_name,last_name,institution,official_institution,official_full_name from n3c_admin.registration where email not in (select email from palantir.n3c_user) and enclave order by 5,4) as n3c_user;
</sql:query>
{
    "headers": [
        {"value":"email", "label":"Email"},
        {"value":"first_name", "label":"First Name"},
        {"value":"last_name", "label":"Last Name"},
        {"value":"institution", "label":"Institution"},
        {"value":"official_institution", "label":"Official Institution"},
        {"value":"official_full_name", "label":"Official Full Name"}
    ],
    "rows" : 
<c:forEach items="${users.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			