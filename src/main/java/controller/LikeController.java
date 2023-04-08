package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;

@WebServlet("/post/like")
public class LikeController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		
		HttpSession session = req.getSession();
		boolean logon = (boolean)session.getAttribute("logon");
		if(!logon) {
			resp.sendRedirect("/user/login");
			return;
		}else {
			
		}
		User one = (User)session.getAttribute("logonUser");
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("userid", one.getId());
		
		SqlSessionFactory factory = (SqlSessionFactory)
				req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		
		
		int result = sqlSession.insert("post.createLike", map);
		
		sqlSession.commit();
		sqlSession.close();
		
		resp.sendRedirect("/post/detail?id="+ id);
		return;
	}
}
