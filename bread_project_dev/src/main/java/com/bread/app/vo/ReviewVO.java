package com.bread.app.vo;


import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
    private int review_idx;
    private int member_idx;
    private int bread_idx;
    private String order_idx; // 주문 인덱스
    private String bread_name; // 빵 이름
    private String bread_img_save; // 빵 이미지
    private int bakery_idx; // 빵집 인덱스
    private int view_count; // 조회수 추가
    private String bakery_name; // 빵집 이름
    private String member_nickname; // 회원 닉네임
    private String review_content; // 리뷰 내용
    private Date review_post_date; // 리뷰 게시 날짜
    private MultipartFile uploadFile; // 파일 처리 리스트
    private List<MultipartFile> uploadFiles; // 여러파일 처리 리스트
    private String originfile_name;
    private String savefile_name;

}
