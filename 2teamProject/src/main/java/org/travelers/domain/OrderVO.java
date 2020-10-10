package org.travelers.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class OrderVO {

	private String order_id;
	private String gcode;
	private String gname;
	private String gtransit;
	private String gconfirmQty;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date gfromDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date gtoDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date order_date;
	
	private String images;
	private String user_id;
	private int amount;
	private int flag;
	
}
