package kr.tracer.entity;

public class Car {

	// t_board table
	
	private int article_seq;
	private String mb_id;
	private String default_name;  //
	private String plate_num;  //
	private int default_money;  // 
	private int default_year;  //
	private int report_num;  //
	private String plate_location;
	private String admin_location;
	private String article_file1;
	private String article_file2;
	private String article_date;
	
	
	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getDefault_name() {
		return default_name;
	}
	public void setDefault_name(String default_name) {
		this.default_name = default_name;
	}
	public String getPlate_num() {
		return plate_num;
	}
	public void setPlate_num(String plate_num) {
		this.plate_num = plate_num;
	}
	public int getDefault_money() {
		return default_money;
	}
	public void setDefault_money(int default_money) {
		this.default_money = default_money;
	}
	public int getDefault_year() {
		return default_year;
	}
	public void setDefault_year(int default_year) {
		this.default_year = default_year;
	}
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public String getPlate_location() {
		return plate_location;
	}
	public void setPlate_location(String plate_location) {
		this.plate_location = plate_location;
	}
	public String getAdmin_location() {
		return admin_location;
	}
	public void setAdmin_location(String admin_location) {
		this.admin_location = admin_location;
	}
	public String getArticle_file1() {
		return article_file1;
	}
	public void setArticle_file1(String article_file1) {
		this.article_file1 = article_file1;
	}
	public String getArticle_file2() {
		return article_file2;
	}
	public void setArticle_file2(String article_file2) {
		this.article_file2 = article_file2;
	}
	public String getArticle_date() {
		return article_date;
	}
	public void setArticle_date(String article_date) {
		this.article_date = article_date;
	}
	
	
}
