package com.bread.app.vo;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BreadVO {
    private int member_idx;
    private int bread_idx;
    private String bread_name;
    private int bread_price;
    private String bread_content;
    private String bread_time1;
    private String bread_time2;
    private String bread_time3;
    private String bread_img;
    private String bread_img_save;
    private int bakery_idx;
    private MultipartFile uploadFile;
    private List<MultipartFile> uploadFiles;
    private int bread_stock;
    private String bread_status;
    private String bakery_name;
    private int bread_del;
//    // 페이징을 위한 필드
//    private int pageNum;   // 사용자가 요청한 페이지 번호
//    private int startIdx;  // SQL 쿼리를 위한 시작 인덱스
}
