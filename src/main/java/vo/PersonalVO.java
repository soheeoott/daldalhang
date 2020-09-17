package vo;

// VO (Value Object, DTO: Data Transfer Object) 
// => 자료를 주고 받는 통로 역할

public class PersonalVO {
	private String id;
	private String password;
	private String email_id;
	private String email_domain;
	private char verify;
	
	// 네이버
	private String code;
	private String state;
	private String naverAccess_token;
	private String naverEmail;

	// 카카오
	private String kakaoAccess_token;
	private String kakaoToken_type;
	private String kakaoRefresh_token;
	private String kakaoExpires_in;
	private String kakaoRefresh_token_expires_in;
	private String kakaoEmail;
	
	// 구글
	private String googleEmail;
	private String googleName;
	
	// login flag
	private String loginFlag;
	
	public String getLoginFlag() {
		return loginFlag;
	}
	public void setLoginFlag(String loginFlag) {
		this.loginFlag = loginFlag;
	}
	public String getGoogleEmail() {
		return googleEmail;
	}
	public void setGoogleEmail(String googleEmail) {
		this.googleEmail = googleEmail;
	}
	public String getGoogleName() {
		return googleName;
	}
	public void setGoogleName(String googleName) {
		this.googleName = googleName;
	}

	public String getNaverAccess_token() {
		return naverAccess_token;
	}
	public void setNaverAccess_token(String naverAccess_token) {
		this.naverAccess_token = naverAccess_token;
	}
	public String getNaverEmail() {
		return naverEmail;
	}
	public void setNaverEmail(String naverEmail) {
		this.naverEmail = naverEmail;
	}
	public String getKakaoAccess_token() {
		return kakaoAccess_token;
	}
	public void setKakaoAccess_token(String kakaoAccess_token) {
		this.kakaoAccess_token = kakaoAccess_token;
	}
	public String getKakaoToken_type() {
		return kakaoToken_type;
	}
	public void setKakaoToken_type(String kakaoToken_type) {
		this.kakaoToken_type = kakaoToken_type;
	}
	public String getKakaoRefresh_token() {
		return kakaoRefresh_token;
	}
	public void setKakaoRefresh_token(String kakaoRefresh_token) {
		this.kakaoRefresh_token = kakaoRefresh_token;
	}
	public String getKakaoExpires_in() {
		return kakaoExpires_in;
	}
	public void setKakaoExpires_in(String kakaoExpires_in) {
		this.kakaoExpires_in = kakaoExpires_in;
	}
	public String getKakaoRefresh_token_expires_in() {
		return kakaoRefresh_token_expires_in;
	}
	public void setKakaoRefresh_token_expires_in(String kakaoRefresh_token_expires_in) {
		this.kakaoRefresh_token_expires_in = kakaoRefresh_token_expires_in;
	}
	public String getKakaoEmail() {
		return kakaoEmail;
	}
	public void setKakaoEmail(String kakaoEmail) {
		this.kakaoEmail = kakaoEmail;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

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