package com.coco.cocotrace.service;

import com.coco.cocotrace.models.Lot;
import com.coco.cocotrace.models.Product;

import java.util.List;

public interface LotService {
    void save(Lot lot);
    Lot findById(int id);
    List<Lot> findAll();
}
