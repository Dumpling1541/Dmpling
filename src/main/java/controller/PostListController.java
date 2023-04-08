package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Like;
import data.Post;

@WebServlet("/post/post-list")
public class PostListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("utf-8");
		//==================================================
		SqlSessionFactory factory = (SqlSessionFactory) 
				req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();

		//--------------------게시글 10개씩 뽑으면서 페이징 처리-------------
		String page =req.getParameter("page");
		String sort = req.getParameter("sort");
		System.out.println("sort ==> "+ sort);
		
		int p;
		if(req.getParameter("page") == null) {
			p = 1;
		}else {
			p = Integer.parseInt(req.getParameter("page"));
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("sort", sort);
		map.put("a", (p-1)*10+1);
		map.put("b", 10*p);
		System.out.println("map ==> "+ map.get("sort"));
		List<Post> list = sqlSession.selectList("post.findByPostAtoBSort", map);
		List<Like> likeList = sqlSession.selectList("post.findByLikeAll"); 
		

		req.setAttribute("postList", list);
		
		int total = sqlSession.selectOne("post.countPost");
		int totalPage = total/10 + (total % 10 > 0 ? 1 : 0);
		int viewPage = 5;
		
		int endPage = (((p-1)/viewPage)+1) * viewPage;
		if(totalPage < endPage) {
		    endPage = totalPage;
		}
		
		int startPage = ((p-1)/viewPage) * viewPage + 1;
		
		int idx = p * 10;
		
		req.setAttribute("idx", idx);
		req.setAttribute("start", startPage);
		req.setAttribute("last", endPage);
		boolean existPrev = p >= 6;
		boolean existNext = true;
		if(endPage >= totalPage)
		{
			existNext = false;
		}
		
		req.setAttribute("existPrev", existPrev);
		req.setAttribute("existNext", existNext);
		
		sqlSession.close();
	
		
		req.getRequestDispatcher("/WEB-INF/views/post/postlist.jsp").forward(req, resp);
	}
}
