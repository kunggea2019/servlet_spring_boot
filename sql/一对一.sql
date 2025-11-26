一对一的例子吧  比如 顾客和汽车
以下是 MySQL 8.0 环境下顾客（主表）和汽车（从表） 的一对一关系完整示例，核心通过「外键 + 唯一约束」实现（一个顾客最多拥有一辆汽车，一辆汽车仅归属一个顾客），包含表结构 DDL、假数据、备份脚本及关联查询，他人可直接恢复使用。
核心逻辑
一对一关系实现方案（推荐「外键 + 唯一约束」，从表关联主表）：
顾客表（customer）：存储顾客基础信息（主表，无外键）
汽车表（car）：存储汽车信息（从表，通过 customer_id 关联顾客表，同时给 customer_id 加唯一约束，确保一个顾客只能对应一辆车）



-- 1. 数据库（备份脚本中会包含建库逻辑）
USE customer_car_db;

-- 2. 顾客表（主表：一对一关系的「一」）
CREATE TABLE IF NOT EXISTS customer (
                                        customer_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '顾客ID（主键）',
                                        customer_name VARCHAR(50) NOT NULL COMMENT '顾客姓名',
    gender ENUM('男', '女', '未知') DEFAULT '未知' COMMENT '性别',
    age TINYINT UNSIGNED COMMENT '年龄',
    phone VARCHAR(20) COMMENT '联系电话',
    address VARCHAR(100) COMMENT '家庭地址',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    UNIQUE KEY uk_customer_phone (phone) COMMENT '联系电话唯一约束'
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='顾客表（主表）';

-- 3. 汽车表（从表：一对一关系的「一」）
CREATE TABLE IF NOT EXISTS car (
                                   car_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '汽车ID（主键）',
                                   customer_id INT COMMENT '所属顾客ID（外键关联顾客表）',
                                   car_brand VARCHAR(50) NOT NULL COMMENT '汽车品牌',
    car_model VARCHAR(50) NOT NULL COMMENT '汽车型号',
    license_plate VARCHAR(20) COMMENT '车牌号',
    purchase_date DATE COMMENT '购买日期',
    car_color VARCHAR(20) COMMENT '汽车颜色',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    -- 关键：唯一约束 + 外键 = 实现一对一
    UNIQUE KEY uk_car_customer (customer_id) COMMENT '顾客ID唯一，确保一个顾客只能有一辆车',
    CONSTRAINT fk_car_customer FOREIGN KEY (customer_id)
    REFERENCES customer (customer_id)
                                                   ON DELETE SET NULL  -- 顾客删除时，汽车的所属顾客设为NULL（保留汽车数据）
                                                   ON UPDATE CASCADE    -- 顾客ID更新时，汽车的关联ID同步更新
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='汽车表（从表，与顾客一对一）';


-- 1. 插入顾客数据（主表）
INSERT INTO customer (customer_name, gender, age, phone, address) VALUES
                                                                      ('张三', '男', 35, '13800138001', '北京市海淀区中关村'),
                                                                      ('李四', '女', 28, '13900139002', '上海市浦东新区陆家嘴'),
                                                                      ('王五', '男', 42, '13700137003', '广州市天河区珠江新城'),
                                                                      ('赵六', '女', 30, '13600136004', '深圳市南山区科技园'),
                                                                      ('孙七', '男', 27, '13500135005', '杭州市西湖区断桥'),
                                                                      ('周八', '女', 33, '13400134006', '成都市锦江区春熙路'),
                                                                      ('吴九', '男', 38, '13300133007', '武汉市洪山区光谷'),
                                                                      ('郑十', '女', 29, '13200132008', '西安市雁塔区大雁塔');

-- 2. 插入汽车数据（从表：关联顾客，部分顾客无车）
INSERT INTO car (customer_id, car_brand, car_model, license_plate, purchase_date, car_color) VALUES
-- 张三的车
(1, '丰田', '凯美瑞', '京A12345', '2020-05-15', '黑色'),
-- 李四的车
(2, '本田', '思域', '沪A67890', '2021-08-22', '白色'),
-- 王五的车
(3, '宝马', '5系', '粤A54321', '2019-03-10', '蓝色'),
-- 赵六的车
(4, '奔驰', 'C级', '粤B09876', '2022-01-30', '银色'),
-- 孙七无车（不插入对应记录）
-- 周八的车
(6, '特斯拉', 'Model 3', '川A11223', '2023-06-18', '红色'),
-- 吴九的车
(7, '大众', '迈腾', '鄂A33445', '2020-11-05', '灰色'),
-- 郑十无车（不插入对应记录）



--  各种查询
-- 1. 查询所有顾客及其汽车信息（左连接，包含无车顾客）
SELECT
    c.customer_id, c.customer_name, c.gender, c.age, c.phone,
    car.car_id, car.car_brand, car.car_model, car.license_plate,
    car.purchase_date, car.car_color
FROM customer c
         LEFT JOIN car ON c.customer_id = car.customer_id
ORDER BY c.customer_id;

-- 2. 查询有车的顾客信息（内连接，只保留有车的顾客）
SELECT
    c.customer_name, c.phone, c.address,
    car.car_brand, car.car_model, car.license_plate, car.car_color
FROM customer c
         INNER JOIN car ON c.customer_id = car.customer_id
ORDER BY c.customer_id;

-- 3. 查询无车的顾客信息
SELECT
    customer_id, customer_name, gender, age, phone, address
FROM customer
WHERE customer_id NOT IN (SELECT COALESCE(customer_id, 0) FROM car);

-- 4. 查询「张三」（customer_id=1）的汽车信息
SELECT
    car_brand, car_model, license_plate, purchase_date, car_color
FROM car
WHERE customer_id = 1;

-- 5. 查询「宝马」品牌汽车的所属顾客信息
SELECT
    c.customer_name, c.gender, c.age, c.phone, c.address,
    car.car_model, car.license_plate, car.purchase_date
FROM car
         JOIN customer c ON car.customer_id = c.customer_id
WHERE car.car_brand = '宝马';

-- 6. 统计各品牌汽车的拥有人数
SELECT
    car_brand, COUNT(customer_id) AS owner_count
FROM car
GROUP BY car_brand
ORDER BY owner_count DESC;

-- 7. 查询2020年及以后购买汽车的顾客信息
SELECT
    c.customer_name, c.age, c.phone,
    car.car_brand, car.car_model, car.purchase_date
FROM car
         JOIN customer c ON car.customer_id = c.customer_id
WHERE car.purchase_date >= '2020-01-01'
ORDER BY car.purchase_date;