package com.coco.cocotrace.controller;

import com.coco.cocotrace.qrcode.QRCodeGenerator;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


// Provide an endpoint to generate QR codes, to be used later
@Controller
public class QRCodeController {

    private static final String QR_CODE_IMAGE_PATH = "./src/main/webapp/images/QRCode.png";

    @GetMapping(value = "/generateAndDownloadQRCode/{codeText}/{width}/{height}")
    public void download(
            @PathVariable("codeText") String codeText,
            @PathVariable("width") Integer width,
            @PathVariable("height") Integer height
    ) throws Exception {

        QRCodeGenerator.generateQRCodeImage(codeText, width, height, QR_CODE_IMAGE_PATH);

    }

    @GetMapping(value = "/generateQRCode/{codeText}/{width}/{height}")
    public ResponseEntity<byte[]> generateQRCode(
            @PathVariable("codeText") String codeText,
            @PathVariable("width") Integer width,
            @PathVariable("height") Integer height) throws Exception  {

        return ResponseEntity.status(HttpStatus.OK).body(QRCodeGenerator.getQRCodeImage(codeText, width, height));

    }

}
