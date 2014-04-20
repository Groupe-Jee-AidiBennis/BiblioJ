
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
		
		<table border="1">
			<thead>
				<tr>
                    
						<th align="center"><g:message code="livre.tire.label" default="Titre" /></th>
						
						<th align="center"><g:message code="livre.auteur.label" default="Auteur" /></th>
						<th align="center"><g:message code="livre.type.label" default="Type" /></th>
                         <th align="center"><g:message code="livre.nombreexemplairesdisponibles.label" default="Exemplaires Disponibles" /></th>
						
						
					
					<th><strong>&nbsp;</strong></th>

				</tr>
			</thead>
			<tbody>
				<g:each in="${livreInstanceList}" status="i" var="livreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>
						<center>
						<g:link action="show" id="${livreInstance.id}">
								${fieldValue(bean: livreInstance, field: "titre")}
							</g:link>
							</center>
							</td>
							<td>
							<center>
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
						 <td align="center">
						
						<g:if test="${fieldValue(bean: livreInstance, field: "nombreExemplairesDisponibles") != '0'}" >
							<center><g:link controller="reservation" action="ajouterDansListLivreReservation"id="${livreInstance.id}">Ajouter au panier</g:link>
						</center>
						</g:if>
						<g:else>
						
						</g:else>
					
					</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${livreInstanceTotal}" />
		</div>
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