package org.travelers.domain;

import javax.mail.internet.InternetAddress;

import lombok.Data;

@Data
public class MailVO {
	
	
	   private String from;
	   private String to;
	   private String subject;
	   private String contents;
	   
	}
