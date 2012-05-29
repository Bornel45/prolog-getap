<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html 
	PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<% String userAgent = request.getHeader("user-agent"); %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>
			<tiles:getAsString name="title" />
		</title>
		<style type="text/css" media="screen">
			@import url("<c:url value="/styles/css-framework/typo.css" />");
			@import url("<c:url value="/styles/css-framework/layout.css" />");
			@import url("<c:url value="/styles/css-framework/menu.css" />");
			@import url("<c:url value="/styles/css-framework/demos.css" />");
			<% if(userAgent.indexOf("Firefox") != -1) { %>
				@import url("<c:url value="/styles/standard.css" />");
			<% } else if(userAgent.indexOf("Safari") != -1) { %>
				@import url("<c:url value="/styles/standardChrome.css" />");
			<% } %>
		</style>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.20/themes/base/jquery-ui.css" type="text/css" media="all" />
		<link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css" type="text/css" media="all" />
			
		<script type="text/javascript" src="../../styles/javascript/prefix.js"></script>
		<script type="text/javascript" src="../../styles/javascript/sorttable.js"></script>	
		<script type="text/javascript" src="../../styles/javascript/fonctions.js"></script>	
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
		<script type="text/javascript" src="../../styles/javascript/jquery.dataTables.js"></script>
		<script src="http://code.jquery.com/ui/1.8.20/jquery-ui.min.js" type="text/javascript"></script>
		
		<script>
		$(document).ready(function() {
			$('.dataTable').dataTable( {
				"oLanguage": {
					"sEmptyTable": "Aucune donn�e correspondante",
					"sLoadingRecords": "Traitement en cour...",
					"sProcessing": "Traitement en cour...",
					"sZeroRecords": "Aucune donn�e correspondante",
					"sInfo": "Affiche de _START_ � _END_ sur _TOTAL_ �l�ments",
					"sInfoEmpty": "Aucun �l�ment",
					"sInfoFiltered": "",
					"sSearch": "<img src='../../images/search.png'>",
					"sLengthMenu": 'Affiche <select>'+
					 	'<option value="5">5</option>'+
					 	'<option value="10">10</option>'+
					 	'<option value="15">15</option>'+
					 	'<option value="20">20</option>'+
					 	'<option value="25">25</option>'+
					 	'<option value="-1">All</option>'+
					 	'</select> �l�ments par page',
					"oPaginate": {
						"sFirst": "<<",
						"sLast": ">>",
						"sNext": ">",
						"sPrevious": "<"
					}
				},
				"aaSorting": [  ],
				"sPaginationType": "full_numbers"
			} );
		} );
		</script>
     	<script>
  			$(document).ready(function() {
   				$("#accordion").accordion({autoHeight:false});
  			});
  			$(document).ready(function() {
   				$("#accordion2").accordion({autoHeight:false});
  			});
  		</script>
        <script>
		  $(document).ready(function() {
		    $("#datepicker" ).datepicker({dateFormat: "yy-mm-dd", 
		    	                          monthNames: ["Janvier","F�vrier","Mars","Avril","Mai","Juin","Juillet","Ao�t","Septembre","Octobre","Novembre","D�cembre"],
		    	                          dayNames: ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"],
		    	                          dayNamesMin: ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"] 
		    });
		  }); 
		</script>
	</head>
	
	<body onload="testRole()">
	
	<div id="banniere">
		<img src="<c:url value="/images/LogoGetap.png"/>" width="155px" height="66px"/>
	</div>
	
	<tiles:insertAttribute name="navigation" />


	<div id="page">

		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<!-- end header -->
		<div>
			<tiles:insertAttribute name="body" />
		</div>
		<!-- end content -->
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
		<!-- end footer -->
	
	<!-- end page -->
	</body>
</html>