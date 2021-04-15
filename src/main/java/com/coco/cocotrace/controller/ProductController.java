package com.coco.cocotrace.controller;

import com.coco.cocotrace.models.Product;
import com.coco.cocotrace.models.User;
import com.coco.cocotrace.service.ProductServiceImpl;
import com.coco.cocotrace.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;
import java.util.Set;

@Controller
public class ProductController {

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping(path = "/addProduct", method= RequestMethod.GET)
    public String create(Model model) {
        model.addAttribute("product", new Product());
        return "product.jsp";
    }

    // Updating lot page
    @RequestMapping(path = "/updateProduct", method= RequestMethod.GET)
    public ModelAndView update(Model model) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("/updateProduct");
        return mv;
    }

    @RequestMapping(value = { "/addProduct" }, method = RequestMethod.POST)
    public String shoppingCartUpdateQty(Model model, Principal principal, @ModelAttribute("product") Product product) {

        User u = userService.findByUsername(principal.getName());
        product.setUser(u);

        productService.save(product);

        return "redirect:/productList";
    }


    @RequestMapping(path = "/productList")
    public ModelAndView userDashboard() {
        ModelAndView mv = new ModelAndView("productList.jsp");
        List<Product> products = productService.findAll();
        mv.addObject("products", products);

        return mv;
    }


}
