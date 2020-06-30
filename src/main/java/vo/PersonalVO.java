package vo;

// ** 공통모듈 구현 1.
// VO (Value Object, DTO: Data Transfer Object) 
// => member 테이블의 구조
// => 자료를 주고 받는 통로 역할

public class PersonalVO {
	private String id;
	private String password;
	private String email;
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "PersonalVO [id=" + id + ", password=" + password + ", email=" + email + "]";
	}
}