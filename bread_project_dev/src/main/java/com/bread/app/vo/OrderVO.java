package com.bread.app.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	private String order_idx;
	private int payment_status;
	private int amount;
	private Date payment_date;
	private int member_idx;
	private String member_name;
	
	private List<ItemVO> itemList;
	
}
