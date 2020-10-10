package org.travelers.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TraveloVO {
	private String gname;
	private String gtransit;
	private String order_id;
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date gfromDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date gtoDate;
	
	
	private int gconfirmQty;
	private int gconfirmCost;
	private int gcost;
	
	
}
