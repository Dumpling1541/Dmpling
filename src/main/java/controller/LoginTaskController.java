package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;

@WebServlet("/user/login-task")
public class LoginTaskController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		// =========================================================
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		User one = sqlSession.selectOne("users.findById", id);
		sqlSession.close();
		// =========================================================

		if (one.getPass().equals(pass)) {
			HttpSession session = req.getSession();
			session.setAttribute("logon", true);
			session.setAttribute("logonUser", one);
			resp.sendRedirect("/index");
			return;
		} else {
			resp.sendRedirect("/user/login.jsp?error=1");
			return;
		}
	}

}
