package org.travelers.service;

import org.springframework.stereotype.Service;
import org.travelers.domain.Criteria;
import org.travelers.domain.ReplyPageDTO;
import org.travelers.domain.ReplyVO;
import org.travelers.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

   private ReplyMapper mapper;

   @Override
   public int insert(ReplyVO vo) {
      log.info("register..."+vo);
      return mapper.insert(vo);
   }

   @Override
   public ReplyVO read(Long rno) {
      log.info("read..."+rno);
      return mapper.read(rno);
   }

   @Override
   public int delete(Long rno) {
      log.info("delete..."+rno);
      return mapper.delete(rno);
   }

   @Override
   public int update(ReplyVO vo) {
      log.info("update..."+vo);
      return mapper.update(vo);
   }
   
   @Override
   public ReplyPageDTO getListWithPaging(Criteria cri, Long qno) {
      log.info("getListWithPaging..."+qno);
      return new ReplyPageDTO(mapper.getCountByQno(qno),mapper.getListWithPaging(cri, qno));
   }

   /*
   @Override
   public List<ReplyVO> getListWithPaging(Criteria cri, Long rno) {
      log.info("getListWithPaging..."+rno);
      return mapper.getListWithPaging(cri, rno);
   }
   */
}