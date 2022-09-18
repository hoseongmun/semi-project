package movie.dto;

public class MovieUserDTO {
	private String userid;
	private String passwd;
	private String name;
	private String hp;
	private String email;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "MovieUserDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", hp=" + hp + ", email="
				+ email + "]";
	}
	public MovieUserDTO(String userid, String passwd, String name, String hp, String email) {
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.hp = hp;
		this.email = email;
	}
	public MovieUserDTO() {

	}

}
