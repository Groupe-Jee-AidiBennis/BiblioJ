
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
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:form action="search" method="post">
					<g:textField name="tf_titre" placeholder="Titre" />
					<g:textField name="tf_type" placeholder="Type" />
					<g:textField name="tf_auteur" placeholder="Auteur" />
					<g:submitButton name="Rechercher" />
				</g:form></li>
		</ul>

	</div>

	<div id="list-livre" class="content scaffold-list" role="main">
		<div id="header">
			<h1>Résultat de la recherche de Livres</h1>
		</div>

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:if test="${livreInstanceTotal == 0}">
			<p>Aucun livre ne correspond à votre recherche</p>
		</g:if>
		<g:else>
			<table border="1" >
				<thead>
					<tr>

						<th><center><g:message code="livre.tire.label" default="Titre" /> </center></th>
						
						<th><center><g:message code="livre.auteur.label" default="Auteur" /> </center></th>
						<th><center><g:message code="livre.type.label" default="Type" /> </center></th>
                         <th> <center><g:message code="livre.nombreexemplairesdisponibles.label" default="Exemplaires Disponibles" /> </center></th>
						
						<th><strong>&nbsp;</strong></th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${livreInstanceList}" status="i" var="livreInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><center><g:link action="show" id="${livreInstance.id}">
									${fieldValue(bean: livreInstance, field: "titre")}
								</g:link>
								</center>
								</td>
							<td><center>
								${fieldValue(bean: livreInstance, field: "auteurs")}
								</center>
							</td>
							<td>
							<center>
								${fieldValue(bean: livreInstance, field: "type")}
								</center>
							</td>

							<td>
							<center>
								${fieldValue(bean: livreInstance, field: "nombreExemplairesDisponibles")}
							</center>
							</td>
							<td class="actionButtons"><span class="actionButton">
									<g:if
										test="${fieldValue(bean: livreInstance, field: "nombreExemplairesDisponibles") != '0'}">
										<center>
										<g:link controller="reservation"
											action="ajouterAuPanier"
											id="${livreInstance.id}">Ajouter au panier</g:link>
											</center>
									</g:if>
									<g:else>
						
									</g:else>
							</span></td>

						</tr>
					</g:each>
				</tbody>
			</table>
		
		<div class="pagination">
			<g:paginate total="${livreInstanceTotal}" />
		</div>
		</g:else>
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
									
									<td><center><g:link controller="reservation" action="supprimerDuPanier" id="${l.id}">Supprimer</g:link></center></td>
									
								</tr>
							</g:each>
						</table>
						
						<div align="center" class="nav" role="navigation">
						<al>
						<la><g:link controller="reservation" action="supprimerTout"><g:message
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