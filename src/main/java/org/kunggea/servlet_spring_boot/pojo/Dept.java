package org.kunggea.servlet_spring_boot.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dept {

    private Integer deptId;           // 部门ID
    private String deptName;          // 部门名称
    private String deptLocation;      // 部门地址
    private LocalDateTime createTime; // 创建时间
    private LocalDateTime updateTime; // 更新时间



    private List<Emp> empList; // 员工列表
}
