package com.coco.cocotrace.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String description;

    private String manufacturingOrigin;

    private Date manufacturingDate;

    private Date consumedBefore;

    private double weight;

    @ManyToMany(fetch=FetchType.EAGER)
    @JsonBackReference
    private Set<Ingredient> ingredients;

    @ManyToOne(fetch=FetchType.EAGER)
    @JsonBackReference
    private User user;

    @OneToMany(mappedBy = "product")
    @JsonManagedReference
    private Set<Lot> lots;



}
