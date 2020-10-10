package org.travelers.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.travelers.domain.Criteria;
import org.travelers.domain.ReplyPageDTO2;
import org.travelers.domain.ReplyVO2;
import org.travelers.service.ReplyService2;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/repliess/")
@Log4j
@AllArgsConstructor
public class ReplyController2 {
	private ReplyService2 service2;	
	
	//댓글 등록
	@PostMapping(value="/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO2 vo2){
		log.info("ReplyVO2: "+vo2);
		
		//댓글 등록 처리
		int insertCount = service2.insert(vo2);
		
		log.info("Reply Insert Count: "+insertCount);
		
		return insertCount==1?new ResponseEntity<String>("success",HttpStatus.OK)
							 :new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}	
	
	//댓글 리스트
	/*
	@GetMapping(value = "/page/{bno}/{page}",
				produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page,
										   @PathVariable("bno") Long bno){
		
		Criteria cri = new Criteria(page, 10);
		
		log.info("get Reply List bno: "+bno);
		
		log.info("cri: "+cri);
		
		return new ResponseEntity<>(service.getListWithPaging(cri,bno), HttpStatus.OK);
	}
	*/
	@GetMapping(value="/page/{nno}/{page}",
            	produces= {MediaType.APPLICATION_ATOM_XML_VALUE,
          		             MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO2> getList(@PathVariable("page") int page,
										@PathVariable("nno") Long nno
	                                            ){
		Criteria cri = new Criteria(page,10);
		
		log.info("get Reply List nno: "+nno);
		
		log.info("cri:"+cri);
		
		ReplyPageDTO2 dto = service2.getListWithPaging(cri, nno);
		log.info("ReplyDTO2: "+dto);
		return new ResponseEntity<>(service2.getListWithPaging(cri, nno),HttpStatus.OK);

}
	//댓글 보기
	@GetMapping(value = "/{rno}",
			 produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO2> get(@PathVariable("rno") Long rno){
		
		log.info("get: "+rno);
		
		return new ResponseEntity<ReplyVO2>(service2.read(rno), HttpStatus.OK);
	}
	
	//댓글 삭제
	@DeleteMapping(value = "/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
			
		log.info("remove: "+rno);
		
		return service2.delete(rno)==1?new ResponseEntity<String>("success",HttpStatus.OK)
									 :new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
					value = "/{rno}",
					consumes = "application/json",			
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO2 vo2,
										 @PathVariable("rno") Long rno){
		vo2.setRno(rno);
		log.info("rno: "+rno);
		log.info("modify: "+vo2);
		
		return service2.update(vo2)==1?
				new ResponseEntity<String>("success", HttpStatus.OK)
			   :new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}	
}
