<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CLoginTagLib">
select jsonb_pretty(jsonb_agg(n3c_user))
from (select * from palantir.n3c_user order by last_name,first_name,official_last_name,official_first_name) as n3c_user;
</sql:query>
{
    "headers": [
        {"value":"email", "label":"Email"},
        {"value":"official_first_name", "label":"Official First Name"},
        {"value":"official_last_name", "label":"Official Last Name"},
        {"value":"first_name", "label":"First Name"},
        {"value":"last_name", "label":"Last Name"},
        {"value":"ror_id", "label":"ROR ID"},
        {"value":"ror_name", "label":"ROR Name"},
        {"value":"orcid_id", "label":"ORCiD"},
        {"value":"expertise", "label":"Expertise"},
        {"value":"therapeutic_area", "label":"Therapeutic Area"},
        {"value":"citizen_scientist", "label":"Citizen Scientist"},
        {"value":"international", "label":"International"},
        {"value":"created", "label":"Created"},
        {"value":"updated", "label":"Updated"},
        {"value":"una_path", "label":"UNA Path"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			