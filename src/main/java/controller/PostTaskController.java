package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;

//포스트 등록 처리하는곳

@WebServlet("/post/post-task")
public class PostTaskController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();

		String id = UUID.randomUUID().toString().split("-")[0];
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		String userId;
		String userPass;
		

		if (req.getParameter("userId") != null) {
			userId = req.getParameter("userId");
		} else {
			User one = (User)session.getAttribute("logonUser");
			userId = one.getId();
		}
		

		Map<String, Object> map = new HashMap<>();
		if(req.getParameter("userpass") != null) {
			userPass = req.getParameter("userpass");
			map.put("userpass", userPass);
		}
		map.put("id", id);
		map.put("title", title);
		map.put("content", content);
		map.put("userid", userId);
		//=========================================================
		SqlSessionFactory factory = (SqlSessionFactory)
				req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.insert("post.create", map);
		sqlSession.commit();
		sqlSession.close();
		//=========================================================
		
		resp.sendRedirect("/post/post-list");
	}
}
