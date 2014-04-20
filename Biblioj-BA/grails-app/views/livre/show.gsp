
<%@ page import="biblioj.Livre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-livre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.listLivre.label"  /></g:link></li>
				</ul>
		</div>
		<div id="show-livre" class="content scaffold-show" role="main">
			<h1><g:message code="default.detaillivre.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list livre">
			
				<g:if test="${livreInstance?.titre}">
				<li class="fieldcontain">
					<span id="titre-label" class="property-label"><g:message code="livre.titre.label" default="Titre" /></span>
					
						<span class="property-value" aria-labelledby="titre-label"><g:fieldValue bean="${livreInstance}" field="titre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${livreInstance?.nombreExemplaires}">
				<li class="fieldcontain">
					<span id="nombreExemplaires-label" class="property-label"><g:message code="livre.nombreExemplaires.label" default="Nombre Exemplaires" /></span>
					
						<span class="property-value" aria-labelledby="nombreExemplaires-label"><g:fieldValue bean="${livreInstance}" field="nombreExemplaires"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${livreInstance?.nombreExemplairesDisponibles}">
				<li class="fieldcontain">
					<span id="nombreExemplairesDisponibles-label" class="property-label"><g:message code="livre.nombreExemplairesDisponibles.label" default="Nombre Exemplaires Disponibles" /></span>
					
						<span class="property-value" aria-labelledby="nombreExemplairesDisponibles-label"><g:fieldValue bean="${livreInstance}" field="nombreExemplairesDisponibles"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${livreInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="livre.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="typeDocument" action="show" id="${livreInstance?.type?.id}">${livreInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${livreInstance?.auteurs}">
				<li class="fieldcontain">
					<span id="auteurs-label" class="property-label"><g:message code="livre.auteurs.label" default="Auteurs" /></span>
					
						<g:each in="${livreInstance.auteurs}" var="a">
						<span class="property-value" aria-labelledby="auteurs-label"><g:link controller="auteur" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${livreInstance?.reservations}">
				<li class="fieldcontain">
					<span id="reservations-label" class="property-label"><g:message code="livre.reservations.label" default="Reservations" /></span>
					
						<g:each in="${livreInstance.reservations}" var="r">
						<span class="property-value" aria-labelledby="reservations-label"><g:link controller="reservation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
		<div>
		<ol class="property-list reservation">
							
				<g:if test="${session.reservationEnCours?.livres}">
					<li class="fieldcontain">
					<h1>
		Panier:
			</h1>
						<table border="1">
							<th><center>Livres du panier </center></th>
							
							<th><center></center></th>
							
							<g:each in="${session.reservationEnCours.livres}" var="l">
								<tr>
									<td><center><g:link controller="livre" action="show" id="${l.id}">${l.titre}</g:link> </center></td>
									
									<td><center><g:link controller="reservation" action="deleteBookFromCurrentReservation" id="${l.id}">Supprimer</g:link></center></td>
									
								</tr>
							</g:each>
						</table>
						
						<div align="center" class="nav" role="navigation">
						<al>
						<la><g:link controller="reservation" action="deleteBookAllExemplariesFromCurrentReservation"><g:message
						code="default.vider.label" /></g:link>
						</la>
						
						
						<la><g:link controller="reservation" action="reserverPanier"><g:message
						code="default.reserver.label" /></g:link>
						</la>
						</al>
						</div>
						
					</li>
				</g:if>
				<g:else>
				<li class="fieldcontain">
				<center>
				<h1>
					Votre panier est vide.
					</h1>
				</center>
					
				</li>
				</g:else>
				
			</ol>
		</div>
	</body>
</html>
