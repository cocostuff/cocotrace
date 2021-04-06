package com.coco.cocotrace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {

    @RequestMapping("/register")
    public ModelAndView register() {

        return new ModelAndView("register");
    }

}
