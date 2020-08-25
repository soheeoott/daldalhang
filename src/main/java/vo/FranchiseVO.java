package vo;

import org.springframework.web.multipart.MultipartFile;

public class FranchiseVO {

	private String frcode;
	private String frename;
	private String frkname;
	private String fruploadfile;
	
	private MultipartFile fruploadfilef; // form 의 inputTag 의 값 전달받기 // 설정 파일 필요
	
	public String getFrcode() {
		return frcode;
	}
	public void setFrcode(String frcode) {
		this.frcode = frcode;
	}
	public String getFrename() {
		return frename;
	}
	public void setFrename(String frename) {
		this.frename = frename;
	}
	public String getFrkname() {
		return frkname;
	}
	public void setFrkname(String frkname) {
		this.frkname = frkname;
	}
	public String getFruploadfile() {
		return fruploadfile;
	}
	public void setFruploadfile(String fruploadfile) {
		this.fruploadfile = fruploadfile;
	}
	public MultipartFile getFruploadfilef() {
		return fruploadfilef;
	}
	public void setFruploadfilef(MultipartFile fruploadfilef) {
		this.fruploadfilef = fruploadfilef;
	}
	
	@Override
	public String toString() {
		return "FranchiseVO [frcode=" + frcode + ", frename=" + frename + ", frkname=" + frkname + ", fruploadfile="
				+ fruploadfile + ", fruploadfilef=" + fruploadfilef + "]";
	}
}