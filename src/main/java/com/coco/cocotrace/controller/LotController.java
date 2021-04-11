package com.coco.cocotrace.controller;

import com.coco.cocotrace.dao.ProductDao;
import com.coco.cocotrace.models.Lot;
import com.coco.cocotrace.models.Product;
import com.coco.cocotrace.models.User;
import com.coco.cocotrace.qrcode.QRCodeGenerator;
import com.coco.cocotrace.service.LotServiceImpl;
import com.coco.cocotrace.service.ProductServiceImpl;
import com.coco.cocotrace.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class LotController {

    @Autowired
    private LotServiceImpl lotService;

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    ProductDao productDao;

    private static final String QR_CODE_IMAGE_PATH = "./src/main/webapp/images/";

    @RequestMapping(path = "/lots")
    public ModelAndView lots() {
        ModelAndView mv = new ModelAndView("lots.jsp");
        List<Lot> lots = lotService.findAll();
        mv.addObject("lots", lots);

        return mv;
    }

    @RequestMapping(path = "/lot")
    public ModelAndView lotDetail(@RequestParam(value="id") int lotId) {
        ModelAndView mv = new ModelAndView("lot.jsp");
        Lot lot = lotService.findById(lotId);
        mv.addObject("lot", lot);
        return mv;
    }

    @RequestMapping(path = "/addLot")
    public ModelAndView create(Model model) {
        model.addAttribute("lot", new Lot());

        List<Product> products = productDao.findAll();
        Map<String, Object> allObjectsMap = new HashMap<String, Object>();
        allObjectsMap.put("products", products);

        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(allObjectsMap);

        mv.setViewName("addLot.jsp");
        return mv;
    }


    @RequestMapping(value = { "/addLot" }, method = RequestMethod.POST)
    public String createLot(Model model, Principal principal, @ModelAttribute("lot") Lot lot) {

        User u = userService.findByUsername(principal.getName());
        lot.setUser(u);

        UUID qrId = UUID.randomUUID();
        lot.setQrCodeId(qrId);
        lotService.save(lot);

        try {
            QRCodeGenerator.generateQRCodeImage(
                    "http://localhost:8082/lot?id="  + lot.getId(),
                    400,
                    400,
                    QR_CODE_IMAGE_PATH + qrId + ".png");
            System.out.println("Created a new lot with URL: " + "http://localhost:8082/lot?id="  + lot.getId());
        } catch (Exception e) {
            System.out.println(e);
        }

//        Map<String, Object> allObjectsMap = new HashMap<String, Object>();
//        allObjectsMap.put("lot", lot);
//        ModelAndView mv = new ModelAndView();
//        mv.addAllObjects(allObjectsMap);

        return "redirect:/lot?id=" + lot.getId();
    }



}
