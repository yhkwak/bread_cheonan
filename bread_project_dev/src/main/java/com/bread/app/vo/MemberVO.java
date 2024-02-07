package com.bread.app.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	
	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_nickname;
	private String member_img;
	private String member_img_save;
	private int option_agree;
	private Date reg_date;
	private Date last_mod_date;
	private int member_del;
	private int grade;
	private MultipartFile uploadFile;
	
}
