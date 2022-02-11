package org.travelers.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//springframework 4버전 이후부터 
@ControllerAdvice("org.travelers.controller")
public class CommonsExceptionHandler {
    @ExceptionHandler(ArithmeticException.class)
    public ModelAndView handleArithmeticException(Exception e) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", e);
        mav.setViewName("/common/arithmeticError");
        return mav;
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception e) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", e);
        mav.setViewName("/common/error");
        return mav;
    }
}
