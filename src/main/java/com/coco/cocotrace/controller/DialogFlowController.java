package com.coco.cocotrace.controller;

import com.coco.cocotrace.dao.LotDao;
import com.coco.cocotrace.models.DialogFlowResponse;
import com.coco.cocotrace.models.FulfillmentText;
import com.coco.cocotrace.models.Lot;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.linecorp.bot.spring.boot.annotation.EventMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.Format;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.UUID;

@RestController
@RequestMapping(value = "/webhook")
public class DialogFlowController {

    @Autowired
    LotDao lotDao;

    @PostMapping
    public FulfillmentText  dialogFlowWebHookS(@RequestBody String requestStr, HttpServletRequest servletRequest) {
        try {
            ObjectMapper jsonMapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            DialogFlowResponse response = jsonMapper.readValue(requestStr, DialogFlowResponse.class);

            String qrCodeId = response.getQueryResult().getQueryText();
            Lot lot = lotDao.findByQrCodeId(UUID.fromString(qrCodeId));

            Calendar calendar = new GregorianCalendar();
            calendar.setTime(lot.getSendingDate());

            int year = calendar.get(Calendar.YEAR);
            int month = calendar.get(Calendar.MONTH) + 1;
            int day = calendar.get(Calendar.DAY_OF_MONTH);
            String sendingDate = day + "/" + month + "/" + year;

            String lotDetails = "This is the lot details for id "
                    + qrCodeId + ". Product is:  "
                    + lot.getProduct().getName() + ". Quantity in the lot: "
                    + lot.getQuantity() + " units. Total weight is: "
                    + lot.getGlobalWeight() + "kg. Product was sent on: "
                    + sendingDate + ".";

            FulfillmentText f = FulfillmentText.builder().fulfillmentText(lotDetails).build();

            return f;

        } catch (Exception ex) {
            System.out.println(ex);
            return null;
        }
    }
}
