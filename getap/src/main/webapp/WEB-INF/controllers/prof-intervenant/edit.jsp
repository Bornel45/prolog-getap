<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="formListConsoForProfInter" action="doedit"
	method="post">
	<form:errors path="*" cssClass="errors" />

	<div class="section">
		<fieldset>

			<div class="form-row">
				<label for="datepicker">Date de l'action :</label>
				<div class="input">
					<form:input id="datepicker" path="dateAction" />
				</div>
			</div>

			<div class="form-row">
				<label for="minutes">Temps d'aide personnalis�e :</label>
				<div class="input">
					<form:input path="minutes" />
				</div>
			</div>

			<div>
				<label for="accPersId">Type d'aide personnalis�e :</label>
				<form:select path="accPersId" items="${lesAP}" itemValue="id"
					itemLabel="nom"></form:select>
			</div>

		</fieldset>

		<form:hidden path="id" />

		<div id="buttonGroup">
			<a href="<c:url value="/app/prof-intervenant/listdctap" />"
				style="text-decoration: none"> <input type="button"
				value="Retour">
			</a> <input type="submit" value="Modifier" />
		</div>
	</div>
</form:form>