package com.coco.cocotrace.dao;

import com.coco.cocotrace.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductDao extends JpaRepository<Product, Integer> {
    Product findById(int id);
}
