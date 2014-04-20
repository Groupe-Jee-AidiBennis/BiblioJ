
<%@ page import="biblioj.Livre"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'livre.label', default: 'Livre')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	
	<a href="#list-livre" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
			
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/livre/list')}"><g:message
						code="default.home.label" /></a></li>
			<li><a  href="${createLink(uri: '/reservation/list')}"><g:message
						code="default.reservation.label" /></a></li>
				<li><g:form action="search" method="post">
		<g:textField name="tf_titre" placeholder="Titre" />
		<g:textField name="tf_type" placeholder="Type" />
		<g:textField name="tf_auteur" placeholder="Auteur"  />
		<g:submitButton name="Rechercher" />
	</g:form></li>
	</ul>
		
	</div>

	<div id="list-livre" class="content scaffold-list" role="main">
		<h1>
		Liste des livres
			</h1>

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		
		
		<div>
		<ol class="property-list reservation">
							
				<g:if test="${session.dispo.size>0}">
					<li class="fieldcontain">
						<table border="1">
							<th><center>Livres disponibles </center></th>
							
							<th><center></center></th>
							
							<g:each in="${session.dispo}" var="l">
								<tr>
									<td><center><g:link controller="livre" action="show" id="${l.id}">${l.titre}</g:link> </center></td>
									
									<td><center><g:link controller="reservation" action="deleteBookFromCurrentReservation" id="${l.id}">Supprimer</g:link></center></td>
									
								</tr>
							</g:each>
						</table>
						
						<div align="center">
						<g:link controller="reservation" action="deleteBookAllExemplariesFromCurrentReservation">Vider le panier</g:link>
						<br>
						<g:link controller="reservation" action="valider">Reserver</g:link>
						</div>
						
					</li>
				
				</g:if>
				<g:if test="${session.indispo.size>0}">
					<li class="fieldcontain">
						<table border="1">
							<th><center>Livres indisponibles </center></th>
							
							
							<g:each in="${session.indispo}" var="l">
								<tr>
									<td><center><g:link controller="livre" action="show" id="${l.id}">${l.titre}</g:link> </center></td>
									
									
								</tr>
							</g:each>
						</table>
						
						
					</li>
		
				</g:if>
			</ol>
		</div>
	</body>
</html>