<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.Helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes : note taker</title>
<%@ include file="All_js_css.jsp"%>
</head>
<body>
		<%@ include file="navbar.jsp"%>
		
	<div class="container-fluid">
		<!-- p-0 m-0 -->

		<br>
		<h1 class="text-uppercase text-center">All Notes</h1>


		<div class="row justify-content-center pb-5 ">
			<div class="col-lg-6 col-xl-6 col-md-6 col-sm-8 col-12">


				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>


				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width: 100px;"
						src="image/letter.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p><b><%= note.getAddedDate() %></b></p>
						<p class="card-text">
							<%=note.getContent()%>
						</p>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
							 <a href="edit.jsp?note_id=<%=note.getId()%>"class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

				<%
				}
				s.close();
				%>

			</div>
		</div>


	</div>
</body>
</html>