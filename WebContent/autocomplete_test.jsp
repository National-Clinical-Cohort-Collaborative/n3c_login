<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<style type="text/css" media="all">
@import "<util:applicationRoot/>/resources/autocomplete.css";
</style>
<script src="<util:applicationRoot/>/abms_data.jsp"></script>
<script src="<util:applicationRoot/>/resources/autocomplete.js"></script>

<!--Make sure the form has the autocomplete function switched off:-->
<form autocomplete="off" action="/action_page.php">
  <div class="autocomplete" style="width:600px;">
    <input id="myInput" type="text" name="myCountry" placeholder="Country">
  </div>
  <input type="submit">
</form>
<script>
autocomplete(document.getElementById("myInput"), countries);
</script>