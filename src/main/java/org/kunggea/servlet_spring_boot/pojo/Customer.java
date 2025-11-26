package org.kunggea.servlet_spring_boot.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
    private Integer customerId;
    private String customerName;
    private String address;



}
