package org.travelers.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsVO {
	private String gcode;
	private String gname;
	private int gcost;
	private String gtype;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date gfromDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date gtoDate;
	private String gterm;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date gregDate;
	private int gminQty;
	private int gmaxQty;
	private int gdiscount;
	private int gdisRate;
	private String gtransit;
	private MultipartFile uploadFile;
	private String gleader;
	private int gcnt;
	private String gcomments;
	private String images;
	private int gscore;
	private int gstar;
	private String searchCondition;
	private String searchKeyword;

	private int gconfirmQty;	//최종인원
	private int gconfirmCost; //최종가격
}
