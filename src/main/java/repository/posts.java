package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;


import data.Post;

public class posts {
	static final String url = "jdbc:oracle:thin:@3.34.136.30:1521:xe";
	static final String user = "C##BRAVO";
	static final String password = "1q2w3e4r";

	// public static int create (String id, String title, String content, )
	public static List<Post> findList() {

		try {
			Connection conn = DriverManager.getConnection(url, user, password);

			String sql = "SELECT * FROM POSTS WHERE = (?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			List<Post> postList = new LinkedList<>();
			while (rs.next()) {
				Post post = new Post();
				post.setId(rs.getString("id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setUserId(rs.getString("userId"));
				post.setUserPass(rs.getString("UserPass"));
				post.setViews(rs.getInt("views"));
//				post.setDate(rs.getDate("Date"));

				postList.add(post);
			}
			conn.close();

			return postList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
