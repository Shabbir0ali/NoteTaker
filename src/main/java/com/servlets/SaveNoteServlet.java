package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.Helper.FactoryProvider;
import com.entities.Note;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();

		String title = req.getParameter("title");
		String content = req.getParameter("content");

		Note note = new Note(title, content, new Date());
		
		
		Session session = FactoryProvider.getFactory().openSession();
		
//		Configuration configuration = new Configuration();
//		configuration.configure("hibernate.cfg.xml");
//		SessionFactory factory = configuration.buildSessionFactory();
		
		// Session session = factory.openSession();

		Transaction transaction = session.beginTransaction();

		session.save(note);
		transaction.commit();
		session.close();
		// FactoryProvider.closeFactory();

		out.println("<h1 style =' text-align:center;'> Note is added succesfully</h1>");
		out.println("<h1 style =' text-align:center;'><a href='all_notes.jsp'>view all notes</a></h1>");
		// System.out.println(note);

	}

}
