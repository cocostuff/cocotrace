package com.coco.cocotrace.service;

import com.coco.cocotrace.dao.LotDao;
import com.coco.cocotrace.models.Lot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class LotServiceImpl implements LotService {

    @Autowired
    private LotDao lotDao;

    @Override
    public void save(Lot lot) {

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        lot.setSendingDateString(df.format(lot.getSendingDate()));
        lotDao.save(lot);
    }

    @Override
    public List<Lot> findAll() {
        return lotDao.findAll();
    }

    @Override
    public Lot findById(int id) {
        return lotDao.findById(id);
    }

}
