package com.coco.cocotrace.service;

import com.coco.cocotrace.models.Product;

import java.util.List;

public interface ProductService {
    void save(Product product);
    List<Product> findAll();
}
