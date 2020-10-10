package org.travelers.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	  private long rno;
	  private long qno;

	  private String reply;
	  private String replyer;
	  private Date replyDate;
	  private Date updateDate;

	}
