package multicampus.kb03.IPOwer.dto;

import java.util.Date;

public class CmtDto {
	 private int COMMENT_PK,USER_PK,ARTICLE_PK;
	   public CmtDto(int cOMMENT_PK, int uSER_PK, int aRTICLE_PK, String cOMMENT_CONTENT, Date cOMMENT_REGDATE) {
		super();
		COMMENT_PK = cOMMENT_PK;
		USER_PK = uSER_PK;
		ARTICLE_PK = aRTICLE_PK;
		COMMENT_CONTENT = cOMMENT_CONTENT;
		COMMENT_REGDATE = cOMMENT_REGDATE;
	}
	private String COMMENT_CONTENT;
	   private Date COMMENT_REGDATE;
	public int getCOMMENT_PK() {
		return COMMENT_PK;
	}
	public void setCOMMENT_PK(int cOMMENT_PK) {
		COMMENT_PK = cOMMENT_PK;
	}
	public int getUSER_PK() {
		return USER_PK;
	}
	public void setUSER_PK3(int uSER_PK) {
		USER_PK = uSER_PK;
	}
	public int getARTICLE_PK() {
		return ARTICLE_PK;
	}
	public void setARTICLE_PK(int aRTICLE_PK) {
		ARTICLE_PK = aRTICLE_PK;
	}
	public String getCOMMENT_CONTENT() {
		return COMMENT_CONTENT;
	}
	public void setCOMMENT_CONTENT(String cOMMENT_CONTENT) {
		COMMENT_CONTENT = cOMMENT_CONTENT;
	}
	public Date getCOMMENT_REGDATE() {
		return COMMENT_REGDATE;
	}
	public void setCOMMENT_REGDATE(Date cOMMENT_REGDATE) {
		COMMENT_REGDATE = cOMMENT_REGDATE;
	}
	@Override
	public String toString() {
		return "CmtDto [COMMENT_PK=" + COMMENT_PK + ", USER_PK=" + USER_PK + ", ARTICLE_PK=" + ARTICLE_PK
				+ ", COMMENT_CONTENT=" + COMMENT_CONTENT + ", COMMENT_REGDATE=" + COMMENT_REGDATE + "]";
	}
	   
}
