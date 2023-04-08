package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Like;
import data.Post;
import data.User;

@WebServlet("/post/detail")
public class DetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		
		//=========================================================
		SqlSessionFactory factory = (SqlSessionFactory)
				req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		//=========================================================
		
		HttpSession session = req.getSession();
		boolean logon = (boolean)session.getAttribute("logon");
		if(logon) {
			sqlSession.update("post.updateViews", id);
		}
		
		User user = (User)session.getAttribute("logonUser");
		Post one = sqlSession.selectOne("post.findByPost", id);
		
		List<Like> list = sqlSession.selectList("post.findByLikeUser", id);
		boolean likeUser = false;
		
		if(user != null) {
			for(Like a : list) {
				if(a.getUserId().equals(user.getId())) {
					likeUser = true;
				}
			}
		}
		
		req.setAttribute("likeCnt", list.size());
		req.setAttribute("likeUser", likeUser);
		req.setAttribute("findPost", one);
		
		sqlSession.commit();
		sqlSession.close();
		req.getRequestDispatcher("/WEB-INF/views/post/detail.jsp").forward(req, resp);
	}
}
