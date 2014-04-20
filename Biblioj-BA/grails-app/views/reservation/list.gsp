
<%@ page import="biblioj.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reservation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><a  href="${createLink(uri: '/livre/list')}"><g:message
						code="default.listLivre.label" /></a></li>
				</ul>
		</div>
		<div id="list-reservation" class="content scaffold-list" role="main">
			<h1><g:message code="default.reservation.label"  /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table border="1">
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'reservation.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="dateReservation" title="${message(code: 'reservation.dateReservation.label', default: 'Date Reservation')}" />
					  <th align="center"><g:message code="reservation.livre.label" default="Livres" /></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "code")}</g:link></td>
					
						<td><g:formatDate date="${reservationInstance.dateReservation}" /></td>
						<td>
							<center>
							${fieldValue(bean: reservationInstance, field: "livres")}
						</center>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservationInstanceTotal}" />
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
