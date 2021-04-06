package com.coco.cocotrace.controller;

import com.coco.cocotrace.models.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

    @RequestMapping(path = "/addProduct", method= RequestMethod.GET)
    public String create(Model model) {
        model.addAttribute("product", new Product());
        return "product.jsp";
    }

}
