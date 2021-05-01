package com.coco.cocotrace.models;

import com.coco.cocotrace.converter.LocalDateJpaConverter;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.Set;

@Entity
@Getter
@Setter
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private String imageUrl;

    private String manufacturingOrigin;

    @Column(nullable = false)
    @Convert(converter = LocalDateJpaConverter.class)
    private LocalDate manufacturingDate;

    @Transient
    private String manufacturingDateString;

    @Column(nullable = false)
    @Convert(converter = LocalDateJpaConverter.class)
    private LocalDate consumedBefore;

    @Transient
    private String consumedBeforeString;

    private double weight;

    @ManyToMany(fetch=FetchType.EAGER)
    @JsonBackReference
    private Set<Ingredient> ingredients;

    @ManyToOne(fetch=FetchType.EAGER)
    @JsonBackReference
    private User user;

    @OneToMany(mappedBy = "product")
//    @JsonManagedReference
    @JsonBackReference
    private Set<Lot> lots;

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDate getManufacturingDate() {
        return manufacturingDate;
    }

    public void setManufacturingDate(LocalDate manufacturingDate) {
        this.manufacturingDate = manufacturingDate;
    }

    public LocalDate getConsumedBefore() {
        return consumedBefore;
    }

    public void setConsumedBefore(LocalDate consumedBefore) {
        this.consumedBefore = consumedBefore;
    }

    public String getManufacturingDateString() {
        return manufacturingDateString;
    }

    public void setManufacturingDateString(String manufacturingDateString) {
        this.manufacturingDateString = manufacturingDateString;
    }

    public String getConsumedBeforeString() {
        return consumedBeforeString;
    }

    public void setConsumedBeforeString(String consumedBeforeString) {
        this.consumedBeforeString = consumedBeforeString;
    }
}
