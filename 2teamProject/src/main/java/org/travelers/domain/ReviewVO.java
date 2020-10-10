package org.travelers.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
   private Long bno; 
   private String title;
   private String content;
   private String writer; 
   @DateTimeFormat(pattern="yyyy/MM/dd")
   private Date regdate;
   @DateTimeFormat(pattern="yyyy/MM/dd")
   private Date updateDate; 
   private String type;
   private MultipartFile UploadFile;
   private String Images;

}
