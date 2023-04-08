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

import data.Post;
import data.User;

@WebServlet("/post/delete-task")
public class DeleteTaskController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String userPass = req.getParameter("userpass");
		
		HttpSession session = req.getSession();
		//=========================================================
		SqlSessionFactory factory = (SqlSessionFactory)
				req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		//=========================================================
		Post one = sqlSession.selectOne("post.findByPost", id);
		User user = (User)session.getAttribute("logonUser");
		
		
		if(one.getUserPass() == null || userPass == null) {
			if(one.getUserId().equals(user.getId())) {
				sqlSession.delete("post.deletePost", id);
				
				sqlSession.commit();
				sqlSession.close();
				resp.sendRedirect("/post/post-list");
				return;
			}
		}else if(one.getUserPass() != null || userPass != null) {
			 if(one.getUserPass().equals(userPass)) {
				 sqlSession.delete("post.deletePost", id);
				 
				 sqlSession.commit();
				 sqlSession.close();
				 resp.sendRedirect("/post/post-list");
				return;
			 }
		}
		
		resp.sendRedirect("/post/delete?id="+id+"&error=1");
		return;
		
	}
}
