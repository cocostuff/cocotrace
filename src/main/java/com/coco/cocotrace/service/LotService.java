package com.coco.cocotrace.service;

import com.coco.cocotrace.models.Lot;

import java.util.List;
import java.util.UUID;

public interface LotService {
    void save(Lot lot);
    Lot findById(int id);
    Lot findByQrCodeId(UUID qrCodeId);
    List<Lot> findAll();
}
