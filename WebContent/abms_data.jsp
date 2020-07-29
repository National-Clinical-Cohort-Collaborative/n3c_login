<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

var countries = [
<sql:query var="abms" dataSource="jdbc/N3CLoginTagLib">
    select board,specialty,subspecialty
    from n3c_admin.abms
    order by 1,2,3;
</sql:query>
<c:forEach items="${abms.rows}" var="row" varStatus="rowCounter">
	<c:if test="${rowCounter.index > 0}">,</c:if>
    "${row.board} : ${row.specialty} : ${row.subspecialty}"
</c:forEach>
];
