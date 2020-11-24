package exam.domain;

import java.time.LocalDateTime;

// member 테이블의 레코드(행) 한개를 표현하는 클래스
public class MemberVo {
	
	private String id;
	private String passwd;
	private String name;
	private Integer age;
	private String gender;
	private String email;
	private LocalDateTime regDate;
	private String address;
	private String tel;
	private String mtel;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberVo [id=").append(id).append(", passwd=").append(passwd).append(", name=").append(name)
				.append(", age=").append(age).append(", gender=").append(gender).append(", email=").append(email)
				.append(", regDate=").append(regDate).append(", address=").append(address).append(", tel=").append(tel)
				.append(", mtel=").append(mtel).append("]");
		return builder.toString();
	}
	
	
	
	
	
}




