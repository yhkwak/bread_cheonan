package com.bread.app.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int notice_idx;
	private String title;
	private String content;
	private String originfile_name;
	private String savefile_name;
	private Date post_date;
	private Date update_date;
	private int del_or_not;
	
	private MultipartFile uploadFile;
}
