package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Helper.FactoryProvider;
import com.entities.Note;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			int parseInt = Integer.parseInt(request.getParameter("note_id").trim());
			
			Session session = FactoryProvider.getFactory().openSession();
			
			Transaction transaction = session.beginTransaction();
			
			
			Note note = session.load(Note.class, parseInt);
			session.delete(note);
			transaction.commit();
			
			response.sendRedirect("all_notes.jsp");
			
			
			session.close();
	}
}