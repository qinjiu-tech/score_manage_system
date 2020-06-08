package pojo;

public class Register {
	private String id;
	private String pwd;
	private String type;

	/*
	 * public RegisterUser(String id, String pwd, String type) { super(); this.id =
	 * id; this.pwd = pwd; this.type = type; }
	 */
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
