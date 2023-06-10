<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@ include file="All_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@ include file="navbar.jsp"%>
		<br>
		<h1 class="text-center">Please fill your note detail</h1>
		<!-- This is add form -->
		<form action="SaveNoteServlet" style="width:700px;max-width:100%;margin:auto;" method="post">
			<div class="form-group">
				<label for="title">Note title</label> <input name="title" required="required"
					type="text" class="form-control" id="title"
					placeholder="Enter here">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required="required" id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;"></textarea>
			</div>
			<div class="container text-center">

				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
</body>
</html>