package exam.domain;

import java.time.LocalDateTime;
import java.util.List;

public class BoardVo {
	
	// JOIN 쿼리로 첨부파일정보를 리스트 필드에 설정 용도
	private List<AttachfileVo> attachList;
	
    private Integer num;
    private String name;
	private String passwd;
	private String subject;
	private String content;
	private Integer readcount;
	private String ip;
	private LocalDateTime regDate;
	   
    private Integer reRef; /* 글 그룹 번호 */
	private Integer reLev; /* 글 들여쓰기 레벨 */
	private Integer reSeq; /* 글 그룹 내에서의 순서 */
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Integer getReadcount() {
		return readcount;
	}
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}

	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public Integer getReRef() {
		return reRef;
	}
	public void setReRef(Integer reRef) {
		this.reRef = reRef;
	}
	public Integer getReLev() {
		return reLev;
	}
	public void setReLev(Integer reLev) {
		this.reLev = reLev;
	}
	public Integer getReSeq() {
		return reSeq;
	}
	public void setReSeq(Integer reSeq) {
		this.reSeq = reSeq;
	}
	public List<AttachfileVo> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachfileVo> attachList) {
		this.attachList = attachList;
	}
	@Override
	public String toString() {
		return "BoardVo [attachList=" + attachList + ", num=" + num + ", name=" + name + ", passwd=" + passwd
				+ ", subject=" + subject + ", content=" + content + ", readcount=" + readcount + ", ip=" + ip
				+ ", regDate=" + regDate + ", reRef=" + reRef + ", reLev=" + reLev + ", reSeq=" + reSeq + "]";
	}
	

}
