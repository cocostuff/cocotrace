package com.coco.cocotrace.models;

import com.coco.cocotrace.converter.LocalDateJpaConverter;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

@Entity
@Getter
@Setter
public class Lot {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String imageUrl;

    private int quantity;

    private double globalWeight;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sendingDate;

    @ManyToOne(fetch= FetchType.EAGER)
    @JsonBackReference
    private Product product;

    @ManyToOne(fetch=FetchType.EAGER)
    @JsonBackReference
    private User user;

    public void setUser(User user) {
        this.user = user;
    }

    @Transient
    public String sendingDateString;

    public String getSendingDateString() {
        return sendingDateString;
    }

    public void setSendingDateString(String sendingDateString) {
        this.sendingDateString = sendingDateString;
    }

    private UUID qrCodeId;
}
