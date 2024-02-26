package com.bread.app.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private String order_idx;
	private int payment_status;
	private int amount;
	private Date payment_date;
	private int member_idx;
}
