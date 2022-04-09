package kr.tracer.entity;

public class Admin {

	private String ad_id;
	private String ad_pw;
	private String ad_name;

	public Admin(String ad_id, String ad_pw, String ad_name) {

		this.ad_id = ad_id;
		this.ad_pw = ad_pw;
		this.ad_name = ad_name;
	}

	public Admin(String ad_id, String ad_pw) {

		this.ad_id = ad_id;
		this.ad_pw = ad_pw;
	}

	public String getAd_id() {
		return ad_id;
	}

	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}

	public String getAd_pw() {
		return ad_pw;
	}

	public void setAd_pw(String ad_pw) {
		this.ad_pw = ad_pw;
	}

	public String getAd_name() {
		return ad_name;
	}

	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}

}
