package sis.com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddSong extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SongList songList = null;
		
		String  songcat = request.getParameter("songcat");
		String  singername	 = request.getParameter("singername");
		float  rating = Float.parseFloat(request.getParameter("rating"));
		
		
		songList = new SongList();
		songList.setSongCategory(songcat);
		songList.setSingerName(singername);
		songList.setRating(rating);
		songList.setSongCategory(songcat);
		
		
		HttpSession session = request.getSession();
		session.setAttribute("songList", songList);

		response.sendRedirect("addAudioSong.jsp");
		
	
	}

}
