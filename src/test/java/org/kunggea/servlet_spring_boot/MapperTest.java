package org.kunggea.servlet_spring_boot;

import org.junit.jupiter.api.Test;
import org.kunggea.servlet_spring_boot.mapper.DeptMapper;
import org.kunggea.servlet_spring_boot.pojo.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class MapperTest {

    @Autowired
    DeptMapper deptMapper;


    @Test
    public void findAllDept() {
        List<Dept> depts = deptMapper.findAllDept();

        for (Dept dept : depts) {
            System.out.println(dept);
        }
    }

}
