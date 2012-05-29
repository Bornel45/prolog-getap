<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h3 class="titre3">Mes demandes de validations</h3>

<c:if test="${empty listdctaps}">
	Il n'y a encore aucune demande. 
</c:if>

<c:if test="${not empty listdctaps}">
	<table class="legend2">
		<tr>
			<td><img src="../../images/valid.png" /> : Valider</td>
			<td><img src="../../images/modif.png" /> : Modifier</td>
			<td><img src="../../images/suppr.png" /> : Refuser</td>
		</tr>
	</table>
	<h5 style="position: relative; top: 35px;">Demandes de validation
		en cours</h5>
	<div id="accordion">
		<h3>
			<a href="#">Demandes re�ues (${etat0 + etat3})</a>
		</h3>
		<div id="demo">
			<table class="display dataTable">
				<thead>
					<tr class="header">
						<th>Eleves</th>
						<th>Date</th>
						<th>Temps (min)</th>
						<th>Type d'aide</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listdctaps}" var="dctap">
						<c:if test="${dctap.etat == 0 or dctap.etat == 3}">
							<tr>
								<td>${dctap.eleve.nom} ${dctap.eleve.prenom}</td>
								<td>${dctap.dateAction}</td>
								<td>${dctap.minutes}</td>
								<td>${dctap.accPers.nom}</td>
								<td><a
									href="<c:url value="/app/prof-intervenant/valid/${dctap.id}" />"><img
										src="../../images/valid.png"
										onmouseover="this.src='../../images/validHover.png';"
										onmouseout="this.src='../../images/valid.png';" /> </a></td>
								<td><a
									href="<c:url value="/app/prof-intervenant/edit?id=${dctap.id}" />"><img
										src="../../images/modif.png"
										onmouseover="this.src='../../images/modifHover.png';"
										onmouseout="this.src='../../images/modif.png';" /> </a></td>
								<td><a href=""
									onclick="if(confirm('Voulez-vous vraiment refuser cette demande ?')){window.location.href='refuse/${dctap.id}';}"><img
										src="../../images/suppr.png"
										onmouseover="this.src='../../images/supprHover.png';"
										onmouseout="this.src='../../images/suppr.png';" /> </a></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<h3>
			<a href="#">Demandes en attentes de confirmations
				(${etat41+etat42+etat43+etat44+etat45+etat46+etat47})</a>
		</h3>
		<div id="demo">
			<table class="display dataTable">
				<thead>
					<tr class="header">
						<th>Eleves</th>
						<th>Date</th>
						<th>Temps (min)</th>
						<th>Type d'aide</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listdctaps}" var="dctap">
						<c:if test="${dctap.etat>40}">
							<tr>
								<td>${dctap.eleve.nom} ${dctap.eleve.prenom}</td>
								<c:if test="${dctap.etat == 41}">
									<td class="isUpdate">${dctap.dateAction}</td>
									<td>${dctap.minutes}</td>
									<td>${dctap.accPers.nom}</td>
								</c:if>
								<c:if test="${dctap.etat == 42}">
									<td>${dctap.dateAction}</td>
									<td class="isUpdate">${dctap.minutes}</td>
									<td>${dctap.accPers.nom}</td>
								</c:if>
								<c:if test="${dctap.etat == 43}">
									<td>${dctap.dateAction}</td>
									<td>${dctap.minutes}</td>
									<td class="isUpdate">${dctap.accPers.nom}</td>
								</c:if>
								<c:if test="${dctap.etat == 44}">
									<td class="isUpdate">${dctap.dateAction}</td>
									<td class="isUpdate">${dctap.minutes}</td>
									<td>${dctap.accPers.nom}</td>
								</c:if>
								<c:if test="${dctap.etat == 45}">
									<td>${dctap.dateAction}</td>
									<td class="isUpdate">${dctap.minutes}</td>
									<td class="isUpdate">${dctap.accPers.nom}</td>
								</c:if>
								<c:if test="${dctap.etat == 46}">
									<td class="isUpdate">${dctap.dateAction}</td>
									<td>${dctap.minutes}</td>
									<td class="isUpdate">${dctap.accPers.nom}</td>
								</c:if>
								<c:if test="${dctap.etat == 47}">
									<td class="isUpdate">${dctap.dateAction}</td>
									<td class="isUpdate">${dctap.minutes}</td>
									<td class="isUpdate">${dctap.accPers.nom}</td>
								</c:if>
								<td><a
									href="<c:url value="/app/prof-intervenant/edit?id=${dctap.id}" />"><img
										src="../../images/modif.png"
										onmouseover="this.src='../../images/modifHover.png';"
										onmouseout="this.src='../../images/modif.png';" /> </a></td>
								<td><a href=""
									onclick="if(confirm('Voulez-vous vraiment refuser cette demande ?')){window.location.href='refuse/${dctap.id}';}"><img
										src="../../images/suppr.png"
										onmouseover="this.src='../../images/supprHover.png';"
										onmouseout="this.src='../../images/suppr.png';" /> </a></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<h5>Demandes terminees</h5>
	<div id="accordion2">
		<h3>
			<a href="#">Demandes valid�es (${etat1 + etat5})</a>
		</h3>
		<div id="demo">
			<table class="display dataTable">
				<thead>
					<tr class="header">
						<th>Eleves</th>
						<th>Date</th>
						<th>Temps (min)</th>
						<th>Type d'aide</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listdctaps}" var="dctap">
						<c:if test="${dctap.etat == 1 or dctap.etat == 5}">
							<tr>
								<td>${dctap.eleve.nom} ${dctap.eleve.prenom}</td>
								<td>${dctap.dateAction}</td>
								<td>${dctap.minutes}</td>
								<td>${dctap.accPers.nom}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<h3>
			<a href="#">Demandes refus�es par l'�l�ve (${etat2})</a>
		</h3>
		<div id="demo">
			<table class="display dataTable">
				<thead>
					<tr class="header">
						<th>Eleves</th>
						<th>Date</th>
						<th>Temps (min)</th>
						<th>Type d'aide</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listdctaps}" var="dctap">
						<c:if test="${dctap.etat == 2}">
							<tr>
								<td>${dctap.eleve.nom} ${dctap.eleve.prenom}</td>
								<td>${dctap.dateAction}</td>
								<td>${dctap.minutes}</td>
								<td>${dctap.accPers.nom}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<h3>
			<a href="#">Demandes annul�es par l'�l�ve (${etat7})</a>
		</h3>
		<div id="demo">
			<table class="display dataTable">
				<thead>
					<tr class="header">
						<th>Eleves</th>
						<th>Date</th>
						<th>Temps (min)</th>
						<th>Type d'aide</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listdctaps}" var="dctap">
						<c:if test="${dctap.etat == 7}">
							<tr>
								<td>${dctap.eleve.nom} ${dctap.eleve.prenom}</td>
								<td>${dctap.dateAction}</td>
								<td>${dctap.minutes}</td>
								<td>${dctap.accPers.nom}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<h3>
			<a href="#">Vos demandes refus�es (${etat6})</a>
		</h3>
		<div id="demo">
			<table class="display dataTable">
				<thead>
					<tr class="header">
						<th>Eleves</th>
						<th>Date</th>
						<th>Temps (min)</th>
						<th>Type d'aide</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listdctaps}" var="dctap">
						<c:if test="${dctap.etat == 6}">
							<tr>
								<td>${dctap.eleve.nom} ${dctap.eleve.prenom}</td>
								<td>${dctap.dateAction}</td>
								<td>${dctap.minutes}</td>
								<td>${dctap.accPers.nom}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</c:if>