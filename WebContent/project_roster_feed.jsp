<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CLoginTagLib">
select
    jsonb_pretty(jsonb_agg(roster))
from
     	(select uid,title,lead_investigator,email,task_team as domain_team,
     			(select jsonb_agg(bindings)
     				from (select domain_team.nid,title
     						from n3c_admin.binding,n3c_admin.domain_team
     						where binding.uid = enclave_project.uid
     						  and binding.nid = domain_team.nid
     					) as bindings
     			) as bindings
     			from n3c_admin.enclave_project, n3c_admin.registration
     			where lead_investigator = first_name||' '||last_name
     			order by title
     	) as roster
;
</sql:query>
{
    "headers": [
        {"value":"title", "label":"Title"},
        {"value":"lead_investigator", "label":"Lead Investigator"},
        {"value":"domain_team", "label":"Domain Team"},
        {"value":"bindings", "label":"Domain Teams"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			