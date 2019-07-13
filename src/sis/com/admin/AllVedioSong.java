package sis.com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.connection.DatabaseConnection;

public class AllVedioSong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		java.util.List<SongList> songList = new ArrayList<SongList>();
		Connection con =null;
		PreparedStatement pstmt= null;
		ResultSet rs  = null;

		try {
			con = DatabaseConnection.getConnection();
			String sql="select * from vedioList ";
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();

			while(rs.next()){
				SongList song = null;
				song = new SongList();
				
				song.setSongId(rs.getLong("songid"));
				song.setSongCategory(rs.getString("songcategory"));
				song.setSongName(rs.getString("songname"));
				song.setRating(rs.getFloat("rating"));
				song.setSingerName(rs.getString("singername"));
				
				songList.add(song);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();

		}finally {
			try {
				DatabaseConnection.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		
		HttpSession session = request.getSession();
		session.setAttribute("songList", songList);
		System.out.println("sesssion created");
		request.getRequestDispatcher("all_vedio.jsp").forward(request, response);
	}
}
