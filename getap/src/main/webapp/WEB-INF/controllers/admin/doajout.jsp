<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <a href="javascript:if(windows.alert('Utilisateur ajout�.')){window.location.href='admin/index.jsp';}"></a> -->
<script>alert('L\'utilisateur a bien �t� enregistr�\n\nLogin : ${userAjoute.login} \n\nMot de passe :${userAjoute.pass}')</script>
<script>
	/* vous pouvez aussi mettre http://www.monsite.com */
	document.location.href="index" 
</script>