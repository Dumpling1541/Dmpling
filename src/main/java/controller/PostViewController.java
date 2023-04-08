package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//글쓰기 화면으로 보내는곳
@WebServlet("/post/posting-view")
public class PostViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		
		
		
	req.getRequestDispatcher("/WEB-INF/views/post/postingview.jsp").forward(req, resp);
		
	}
}
