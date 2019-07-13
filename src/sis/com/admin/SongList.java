package sis.com.admin;

public class SongList {
	private long songId;
	private String singerName;
	private String songCategory;
	private String songName;
	private float rating;
	public long getSongId() {
		return songId;
	}
	public void setSongId(long songId) {
		this.songId = songId;
	}
	public String getSingerName() {
		return singerName;
	}
	public void setSingerName(String singerName) {
		this.singerName = singerName;
	}
	public String getSongCategory() {
		return songCategory;
	}
	public void setSongCategory(String songCategory) {
		this.songCategory = songCategory;
	}
	public String getSongName() {
		return songName;
	}
	public void setSongName(String songName) {
		this.songName = songName;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	
	
}
