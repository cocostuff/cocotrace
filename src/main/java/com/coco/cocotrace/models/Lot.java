package com.coco.cocotrace.models;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Lot {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int quantity;

    private double globalWeight;

    private Date sendingDate;

    @ManyToOne(fetch= FetchType.EAGER)
    @JsonBackReference
    private Product product;
}
