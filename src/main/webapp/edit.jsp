<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.Helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="All_js_css.jsp"%>
<title>Edit Page : Note taker</title>
</head>
<body>
	<div class="container-fluid ">
		<!-- p-0 m-0 -->
		<%@ include file="navbar.jsp"%>

		<br>
		<h1 class="text-center">This is Edit page</h1>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id"));
		Session ses = FactoryProvider.getFactory().openSession();
		Note note = ses.load(Note.class, noteId);
		%>
		<form action="SaveNoteServlet" style="width:700px;max-width:100%;margin:auto;" method="post">
			<div class="form-group">
				<label for="title">Note title</label> <input name="title"
					required="required" type="text" class="form-control" id="title"
					placeholder="Enter here" value="<%=note.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required="required" id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;"><%=note.getContent()%></textarea>
			</div>
			<div class="container text-center">

				<button type="submit" class="btn btn-success">Save Your
					Notes</button>
			</div>
		</form>


	</div>
</body>
</html>