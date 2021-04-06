package com.coco.cocotrace.models;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Ingredient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id ;

    private String name;

    private String origin;

    @ManyToMany(mappedBy = "ingredients")
    private Set<Product> products;

}
