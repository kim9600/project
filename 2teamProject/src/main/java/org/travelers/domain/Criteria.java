package org.travelers.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	
	//검색타입, 검색어 저장 속성
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,12);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type==null?new String[] {}:type.split("");
	}
}
