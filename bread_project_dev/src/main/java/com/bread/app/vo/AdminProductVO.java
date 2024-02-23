package com.bread.app.vo;

import lombok.Data;

@Data
public class AdminProductVO {
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
    private int bread_stock;
    private String bread_status;
    private String bakery_name;
    private int bread_del;
}
