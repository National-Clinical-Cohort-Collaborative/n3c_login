<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CLoginTagLib">
select
    jsonb_pretty(jsonb_agg(roster))
from
     	(select uid,title,lead_investigator,task_team as domain_team
     			from n3c_admin.enclave_project
     			order by title
     	) as roster
;
</sql:query>
{
    "headers": [
        {"value":"title", "label":"Title"},
        {"value":"lead_investigator", "label":"Lead Investigator"},
        {"value":"domain_team", "label":"Domain Team"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			