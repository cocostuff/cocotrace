package com.coco.cocotrace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LotsController {

    @RequestMapping("/lots")
    public ModelAndView lots() {

        return new ModelAndView("lots");
    }

}
