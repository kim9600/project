package org.travelers.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	private Long qno; 
	private String title;
	private String content;
	private String writer; 
	private Date regdate;
	private Date updateDate; 
	private String type;
}
