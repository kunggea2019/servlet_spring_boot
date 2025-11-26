-- 1. 数据库（若未创建，备份脚本中会包含建库逻辑）

-- 2. 学生表（主表1）
CREATE TABLE IF NOT EXISTS student (
                                       student_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '学生ID（主键）',
                                       student_name VARCHAR(50) NOT NULL COMMENT '学生姓名',
    gender ENUM('男', '女', '未知') DEFAULT '未知' COMMENT '性别',
    age TINYINT UNSIGNED COMMENT '年龄',
    grade VARCHAR(20) COMMENT '年级（如：2022级）',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生表';

-- 3. 课程表（主表2）
CREATE TABLE IF NOT EXISTS course (
                                      course_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '课程ID（主键）',
                                      course_name VARCHAR(100) NOT NULL COMMENT '课程名称',
    teacher VARCHAR(50) COMMENT '授课老师',
    credit TINYINT UNSIGNED NOT NULL COMMENT '学分',
    course_hour INT COMMENT '课时',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    UNIQUE KEY uk_course_name (course_name) COMMENT '课程名称唯一约束'
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程表';

-- 4. 学生课程关联表（中间表：核心关联多对多关系）
CREATE TABLE IF NOT EXISTS student_course (
                                              id INT PRIMARY KEY AUTO_INCREMENT COMMENT '关联ID（主键，可选，方便单条操作）',
                                              student_id INT NOT NULL COMMENT '学生ID（外键关联学生表）',
                                              course_id INT NOT NULL COMMENT '课程ID（外键关联课程表）',
                                              score TINYINT UNSIGNED COMMENT '课程成绩（0-100分，NULL表示未考核）',
                                              choose_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '选课时间',
    -- 联合唯一约束：避免学生重复选同一门课
                                              UNIQUE KEY uk_student_course (student_id, course_id),
    -- 外键约束1：关联学生表
    CONSTRAINT fk_sc_student FOREIGN KEY (student_id)
    REFERENCES student (student_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    -- 外键约束2：关联课程表
    CONSTRAINT fk_sc_course FOREIGN KEY (course_id)
    REFERENCES course (course_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生课程关联表（多对多中间表）';

-- 1. 插入学生数据（主表1）
INSERT INTO student (student_name, gender, age, grade) VALUES
                                                           ('张三', '男', 20, '2022级'),
                                                           ('李四', '女', 19, '2023级'),
                                                           ('王五', '男', 21, '2021级'),
                                                           ('赵六', '女', 20, '2022级'),
                                                           ('孙七', '男', 19, '2023级'),
                                                           ('周八', '女', 20, '2022级'),
                                                           ('吴九', '男', 22, '2021级'),
                                                           ('郑十', '女', 19, '2023级');

-- 2. 插入课程数据（主表2）
INSERT INTO course (course_name, teacher, credit, course_hour) VALUES
                                                                   ('MySQL数据库', '李老师', 3, 48),
                                                                   ('Java编程', '王老师', 4, 64),
                                                                   ('计算机网络', '张老师', 3, 48),
                                                                   ('数据结构', '刘老师', 4, 64),
                                                                   ('Python爬虫', '陈老师', 2, 32),
                                                                   ('人工智能导论', '黄老师', 3, 48);

-- 3. 插入选课关联数据（中间表：体现多对多关系）
INSERT INTO student_course (student_id, course_id, score, choose_time) VALUES
-- 张三选3门课
(1, 1, 92, '2024-09-01'),
(1, 2, 88, '2024-09-01'),
(1, 4, 95, '2024-09-02'),
-- 李四选2门课
(2, 1, 85, '2024-09-01'),
(2, 3, 79, '2024-09-03'),
-- 王五选4门课
(3, 2, 90, '2024-09-01'),
(3, 3, 86, '2024-09-02'),
(3, 4, 89, '2024-09-02'),
(3, 5, 93, '2024-09-03'),
-- 赵六选2门课
(4, 1, 91, '2024-09-01'),
(4, 6, 83, '2024-09-04'),
-- 孙七选3门课
(5, 2, 87, '2024-09-02'),
(5, 5, 82, '2024-09-03'),
(5, 6, 78, '2024-09-04'),
-- 周八选2门课
(6, 3, 94, '2024-09-01'),
(6, 4, 85, '2024-09-02'),
-- 吴九选3门课
(7, 1, 88, '2024-09-01'),
(7, 2, 91, '2024-09-02'),
(7, 6, 90, '2024-09-03'),
-- 郑十选2门课（未考核，score为NULL）
(8, 3, NULL, '2024-09-04'),
(8, 5, NULL, '2024-09-04');



-- 查询所有学生的选课信息
select s.student_id,s.student_name,
       c.course_id,c.course_name
from student s
         left join student_course sc on s.student_id = sc.student_id
         left join course c on sc.course_id = c.course_id