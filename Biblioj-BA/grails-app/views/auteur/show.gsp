
<%@ page import="biblioj.Auteur" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'auteur.label', default: 'Auteur')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-auteur" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.listAuteur.label"  /></g:link></li>
				</ul>
		</div>
		<div id="show-auteur" class="content scaffold-show" role="main">
			<h1><g:message code="default.detailauteur.label"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list auteur">
			
				<g:if test="${auteurInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="auteur.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${auteurInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${auteurInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="auteur.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${auteurInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${auteurInstance?.livres}">
				<li class="fieldcontain">
					<span id="livres-label" class="property-label"><g:message code="auteur.livres.label" default="Livres" /></span>
					
						<g:each in="${auteurInstance.livres}" var="l">
						<span class="property-value" aria-labelledby="livres-label"><g:link controller="livre" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
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
