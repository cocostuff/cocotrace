package com.coco.cocotrace.service;

import com.coco.cocotrace.dao.ProductDao;
import com.coco.cocotrace.models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    ProductDao productDao;

    @Override
    public void save(Product product) {

        product.setManufacturingDate(LocalDate.parse(product.getManufacturingDateString()));
        product.setConsumedBefore(LocalDate.parse(product.getConsumedBeforeString()));

        productDao.save(product);
    }

    @Override
    public List<Product> findAll() {
        return productDao.findAll();
    }


}
