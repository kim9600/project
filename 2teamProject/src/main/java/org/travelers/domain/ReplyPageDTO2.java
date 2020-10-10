package org.travelers.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO2 {
	private int replyCnt;
	private List<ReplyVO2> list;
}
