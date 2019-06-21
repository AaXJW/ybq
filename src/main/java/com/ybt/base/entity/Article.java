package com.ybt.base.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="Article")
public class Article extends BaseStringEntity {

	private String articleHeader;//文章标题
	
	private String content;//文章内容
	
	private String showTime;//显示时间
	
	private String imagePath;//图片地址
	
	private String type;//文章类型
	
	private int first;//是否置顶
	
	private int loopImage;//是否轮播图
	
	private Date addDate;


	public String getArticleHeader() {
		return articleHeader;
	}

	public void setArticleHeader(String articleHeader) {
		this.articleHeader = articleHeader;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLoopImage() {
		return loopImage;
	}

	public void setLoopImage(int loopImage) {
		this.loopImage = loopImage;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	
	
	
	
}
