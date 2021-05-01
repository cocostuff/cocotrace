package com.coco.cocotrace.controller;

import com.coco.cocotrace.dao.LotDao;
import com.coco.cocotrace.dao.ProductDao;
import com.coco.cocotrace.models.Lot;
import com.coco.cocotrace.models.Product;
import com.coco.cocotrace.models.User;
import com.coco.cocotrace.qrcode.QRCodeGenerator;
import com.coco.cocotrace.service.LotServiceImpl;
import com.coco.cocotrace.service.ProductServiceImpl;
import com.coco.cocotrace.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
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

    @Autowired
    LotDao lotDao;

    @Value(value = "${spring.application.url}")
    String url;

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

    @RequestMapping(path = "/deleteLot", method = RequestMethod.GET)
    public String deleteLot(@RequestParam(value="id") int lotId) {
        lotDao.deleteById(lotId);
        return "redirect:/lots";
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

    // Updating lot page
    @RequestMapping(path = "/updateLot")
    public ModelAndView update(@RequestParam(value="id") int lotId, Model model) {
        Lot lot = lotService.findById(lotId);

        model.addAttribute("lot", lot);

        List<Product> products = productDao.findAll();
        Map<String, Object> allObjectsMap = new HashMap<String, Object>();
        allObjectsMap.put("products", products);

        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(allObjectsMap);

        mv.setViewName("updateLot.jsp");
        return mv;
    }

    @RequestMapping(value = "/updateLot", method = RequestMethod.POST)
    public String updateLot(@ModelAttribute("lot") Lot lot, Principal principal) {
        User u = userService.findByUsername(principal.getName());
        lot.setUser(u);
        lotService.save(lot);
        return "redirect:/lot?id=" + lot.getId();
    }


    @RequestMapping(value = { "/addLot" }, method = RequestMethod.POST)
    public String createLot(Model model, Principal principal, @ModelAttribute("lot") Lot lot, HttpServletRequest request) {

        User u = userService.findByUsername(principal.getName());
        lot.setUser(u);

        UUID qrId = UUID.randomUUID();
        lot.setQrCodeId(qrId);
        lotService.save(lot);

        String domain = System.getenv().get("APP_URL");
        if (domain == null) {
            domain = request.getScheme() + "://" + url;
        }

        try {
            QRCodeGenerator.generateQRCodeImage(
                    domain + "/lot?id="  + lot.getId(),
                    400,
                    400,
                    QR_CODE_IMAGE_PATH + qrId + ".png");
        } catch (Exception e) {
            System.out.println(e);
        }

        return "redirect:/lot?id=" + lot.getId();
    }

    // REST API for future chatbot usage
    @CrossOrigin
    @ResponseBody
    @GetMapping("/api/v1/lot")
    public List<Lot> getAllLots() {
        return lotDao.findAll();
    }

    @CrossOrigin
    @ResponseBody
    @GetMapping("/api/v1/lot/{id}")
    public Lot getLot(@PathVariable int id) {
        Lot lot = lotDao.findById(id);
        return lot;
    }

    @CrossOrigin
    @ResponseBody
    @GetMapping("/api/v1/lot/qr/{qrCodeId}")
    public Lot getLotByQrCode(@PathVariable String qrCodeId) {
        Lot lot = lotDao.findByQrCodeId(UUID.fromString(qrCodeId));
        return lot;
    }


}
