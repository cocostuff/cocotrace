package com.coco.cocotrace.controller;

import com.coco.cocotrace.dao.LotDao;
import com.coco.cocotrace.models.DialogFlowResponse;
import com.coco.cocotrace.models.FulfillmentText;
import com.coco.cocotrace.models.Lot;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.dialogflow.v2.model.GoogleCloudDialogflowV2Intent;
import com.google.api.services.dialogflow.v2.model.GoogleCloudDialogflowV2WebhookRequest;
import com.google.api.services.dialogflow.v2.model.GoogleCloudDialogflowV2WebhookResponse;
import com.google.cloud.dialogflow.v2beta1.WebhookResponse;
import net.bytebuddy.implementation.bytecode.Throw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.UUID;

@RestController
@RequestMapping(value = "/webhook")
public class DialogFlowController {

    @Autowired
    LotDao lotDao;

    private static JacksonFactory jacksonFactory = JacksonFactory.getDefaultInstance();

    @PostMapping(consumes = "application/json")
    public ResponseEntity<?> getIntent(@RequestBody String requestStr, HttpServletRequest servletRequest) {
        try {
            // Step 1. Parse the request
            GoogleCloudDialogflowV2WebhookRequest request = jacksonFactory.createJsonParser(requestStr).parse(GoogleCloudDialogflowV2WebhookRequest.class);
            GoogleCloudDialogflowV2WebhookResponse response = new GoogleCloudDialogflowV2WebhookResponse();
            GoogleCloudDialogflowV2Intent intent = request.getQueryResult().getIntent();
            String name = intent.getDisplayName();

            switch (name) {
                case "Default Fallback Intent":
                    System.out.println("========= Intent: Default Fallback Intent =========");
                    break;
                case "GetLot":
                    System.out.println("====== Intent: GetLot =====");
                    String qrCodeId = request.getQueryResult().getQueryText();
                    response = getLotById(qrCodeId);
                    break;
                default:
                    break;
            }

            return new ResponseEntity<GoogleCloudDialogflowV2WebhookResponse>(response, HttpStatus.OK);

        } catch (Exception ex) {
            System.out.println("=============== Error ===============");
            return new ResponseEntity<Object>(ex.getMessage(),HttpStatus.BAD_REQUEST);
        }

    }

    private GoogleCloudDialogflowV2WebhookResponse getLotById(String qrCodeId) {
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

        GoogleCloudDialogflowV2WebhookResponse response = new GoogleCloudDialogflowV2WebhookResponse();
        response.setFulfillmentText(lotDetails);
        return response;
    }

   /* @PostMapping(value = "/getLotById")
    public FulfillmentText dialogFlowWebHookS(@RequestBody String requestStr, HttpServletRequest servletRequest) {
        try {
            ObjectMapper jsonMapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            DialogFlowResponse response = jsonMapper.readValue(requestStr, DialogFlowResponse.class);

            String qrCodeId = response.getQueryResult().getQueryText();
            Lot lot = lotDao.findByQrCodeId(UUID.fromString(qrCodeId));

            WebhookResponse res = WebhookResponse.newBuilder().build();

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
            FulfillmentText fl = FulfillmentText.builder().fulfillmentText("Sorry, there is no lot associated to this ID!").build();
            return fl;
        }
    }*/
}



