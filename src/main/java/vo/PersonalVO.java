package vo;

// ** 공통모듈 구현 1.
// VO (Value Object, DTO: Data Transfer Object) 
// => member 테이블의 구조
// => 자료를 주고 받는 통로 역할

public class PersonalVO {
	private String id;
	private String password;
	private String email_id;
	private String email_domain;
	private char verify;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getEmail_domain() {
		return email_domain;
	}
	public void setEmail_domain(String email_domain) {
		this.email_domain = email_domain;
	}
	public char getVerify() {
		return verify;
	}
	public void setVerify(char verify) {
		this.verify = verify;
	}
	
	@Override
	public String toString() {
		return "PersonalVO [id=" + id + ", password=" + password + ", email_id=" + email_id + ", email_domain="
				+ email_domain + ", verify=" + verify + "]";
	}
	
}