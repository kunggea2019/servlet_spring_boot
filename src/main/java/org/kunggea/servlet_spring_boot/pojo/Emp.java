package org.kunggea.servlet_spring_boot.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Emp {
    private Integer empId;            // 员工ID
    private String empName;           // 员工姓名
    private String gender;            // 性别
    private Integer age;              // 年龄
    private String job;               // 职位
    private BigDecimal salary;        // 月薪
    private Integer deptId;           // 所属部门ID
    private LocalDate hireDate;       // 入职日期
    private LocalDateTime createTime; // 创建时间
    private LocalDateTime updateTime; // 更新时间
}
