-- create database docking;

-- use docking;

CREATE TABLE machines (
  machine_id INT PRIMARY KEY,
  model VARCHAR(150),
  release_year INT,
  sales_year INT,
  units_sold INT
);

CREATE TABLE batteries (
  battery_id INT PRIMARY KEY,
  battery_model VARCHAR(100),
  chemistry VARCHAR(50),     -- optional
  capacity_wh INT            -- optional
);

CREATE TABLE machine_battery_map (
  map_id INT PRIMARY KEY,
  machine_id INT,
  battery_id INT,
  FOREIGN KEY (machine_id) REFERENCES machines(machine_id),
  FOREIGN KEY (battery_id) REFERENCES batteries(battery_id)
);



CREATE TABLE battery_sales (
  sale_id INT PRIMARY KEY,
  battery_id INT,
  sales_year INT,
  units_sold INT,
  FOREIGN KEY (battery_id) REFERENCES batteries(battery_id)
);

CREATE TABLE machine_survival_rate (
  year_age INT PRIMARY KEY,
  survival_rate DECIMAL(4,3)  -- ví dụ 0.82 = 82%
);

CREATE TABLE machine_survival_by_model (
  model VARCHAR(150),
  year_age INT,
  survival_rate DECIMAL(4,3),
  PRIMARY KEY (model, year_age)
);

CREATE TABLE battery_replacement_rate_by_model (
  model VARCHAR(150),
  replacement_rate DECIMAL(4,3),
  PRIMARY KEY (model)
);


CREATE TABLE battery_replacement_rate_by_segment (
  segment VARCHAR(100),
  replacement_rate DECIMAL(4,3),
  PRIMARY KEY (segment)
);



INSERT INTO machines (machine_id, model, release_year, sales_year, units_sold) VALUES
(1, 'Latitude E5450', 2015, 2015, 180000),
(2, 'Latitude E5450', 2015, 2016, 165000),
(3, 'Latitude E5450', 2015, 2017, 120000),

(4, 'Latitude E5550', 2015, 2015, 150000),
(5, 'Latitude E5550', 2015, 2016, 140000),
(6, 'Latitude E5550', 2015, 2017, 100000),

(7, 'Latitude E7440', 2014, 2014, 130000),
(8, 'Latitude E7440', 2014, 2015, 110000),
(9, 'Latitude E7440', 2014, 2016, 80000),

(10, 'Inspiron 15-3558', 2015, 2015, 250000),
(11, 'Inspiron 15-3558', 2015, 2016, 220000),
(12, 'Inspiron 15-3558', 2015, 2017, 170000),

(13, 'Inspiron 14-3458', 2015, 2015, 200000),
(14, 'Inspiron 14-3458', 2015, 2016, 190000),
(15, 'Inspiron 14-3458', 2015, 2017, 150000),

(16, 'Vostro 3560', 2013, 2013, 90000),
(17, 'Vostro 3560', 2013, 2014, 75000),
(18, 'Vostro 3560', 2013, 2015, 60000),

(19, 'Vostro 3460', 2013, 2013, 85000),
(20, 'Vostro 3460', 2013, 2014, 70000),
(21, 'Vostro 3460', 2013, 2015, 55000);

select * from machines;

INSERT INTO machine_survival_rate (year_age, survival_rate) VALUES
(0, 1.00),
(1, 0.95),
(2, 0.90),
(3, 0.82),
(4, 0.70),
(5, 0.55),
(6, 0.40),
(7, 0.30),
(8, 0.25);




INSERT INTO battery_replacement_rate_by_segment (segment, replacement_rate) VALUES
('office_basic', 0.20),     -- dân văn phòng
('heavy_user', 0.35),       -- dùng nhiều
('gaming_or_dev', 0.55),    -- chạy tải cao
('plugged_in_mostly', 0.10),-- cắm điện là chính
('rarely_replace', 0.05);   -- “khỏi thay, xài tạm”

select * from battery_replacement_rate_by_segment;
select * from machine_survival_rate;
select * from machines;

-- tạo bảng sao của machines
CREATE TABLE machines_calc AS
SELECT * FROM machines;

-- Thêm cột tuổi máy và tỉ lệ sống sót
ALTER TABLE machines_calc ADD COLUMN age INT;
-- Tuổi máy = year(now()) - sales_year
ALTER TABLE machines_calc ADD COLUMN survival_rate DECIMAL(4,3);
-- Sau đó join với bảng machine_survival_rate để lấy survival_rate tương ứng:


UPDATE machines_calc m
JOIN machine_survival_rate ms
  ON ms.year_age = (YEAR(NOW()) - m.sales_year)
SET m.age = YEAR(NOW()) - m.sales_year,
    m.survival_rate = ms.survival_rate;
    
-- Tính số máy còn lại
ALTER TABLE machines_calc ADD COLUMN remaining_units INT;

UPDATE machines_calc
SET remaining_units = units_sold * survival_rate;

--  tính số máy còn lại theo từng model
CREATE TABLE estimate_by_model AS
SELECT model, 
       SUM(remaining_units) AS total_remaining_units
FROM machines_calc
GROUP BY model;








