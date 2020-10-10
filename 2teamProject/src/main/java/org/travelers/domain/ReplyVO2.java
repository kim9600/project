package org.travelers.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO2 {

	  private Long rno;
	  private Long nno;

	  private String reply;
	  private String replyer;
	  private Date replyDate;
	  private Date updateDate;

	}
