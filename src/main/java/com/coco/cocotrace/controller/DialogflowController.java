package com.coco.cocotrace.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class DialogflowController {

    @RequestMapping(value = "/webhook", method = RequestMethod.POST)
    public String webhook(@RequestBody String request) throws Exception {
        System.out.println("In the DF controller");
        System.out.println(request);

        return "Done";
    }

}
