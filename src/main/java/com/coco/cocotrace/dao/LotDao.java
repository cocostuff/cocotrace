package com.coco.cocotrace.dao;

import com.coco.cocotrace.models.Lot;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface LotDao extends JpaRepository<Lot, Integer> {
    Lot findById(int id);
    Lot findByQrCodeId(UUID qrCodeId);
}
