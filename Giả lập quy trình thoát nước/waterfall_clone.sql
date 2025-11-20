CREATE DATABASE waterfall
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE waterfall;

-- Bảng hồ chứa
CREATE TABLE Reservoir (
    reservoir_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    full_capacity FLOAT,
    dead_storage FLOAT,
    useful_storage FLOAT,
    normal_water_level FLOAT,
    max_operating_level FLOAT,
    sedimentation_rate FLOAT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bảng sông / dòng chảy
CREATE TABLE River (
    river_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    min_flow FLOAT,
    flood_flow FLOAT,
    outflow FLOAT,
    reservoir_id INT,
    FOREIGN KEY (reservoir_id) REFERENCES Reservoir(reservoir_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bảng lưu lượng / xả hồ
CREATE TABLE Reservoir_Discharge (
    discharge_id INT AUTO_INCREMENT PRIMARY KEY,
    reservoir_id INT NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT NOW(),
    inflow FLOAT,
    release_flow FLOAT,
    spillway_flow FLOAT,
    hydro_use_flow FLOAT,
    FOREIGN KEY (reservoir_id) REFERENCES Reservoir(reservoir_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bảng mưa / lưu lượng bổ sung
CREATE TABLE Rainfall_Runoff (
    rainfall_id INT AUTO_INCREMENT PRIMARY KEY,
    river_id INT NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT NOW(),
    rainfall_amount FLOAT,
    duration FLOAT,
    estimated_inflow FLOAT,
    FOREIGN KEY (river_id) REFERENCES River(river_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert bảng Reservoir
INSERT INTO Reservoir (name, full_capacity, dead_storage, useful_storage, normal_water_level, max_operating_level, sedimentation_rate)
VALUES
('Hồ Ba Hạ', 350000000, 50000000, 300000000, 40, 45, 1000000),
('Hồ Sông Hương', 80000000, 10000000, 70000000, 15, 18, 200000),
('Hồ Vu Gia', 120000000, 20000000, 100000000, 30, 35, 500000),
('Hồ Thu Bồn', 150000000, 25000000, 125000000, 32, 37, 600000);

-- Insert bảng River
INSERT INTO River (name, min_flow, flood_flow, outflow, reservoir_id)
VALUES
('Sông Ba Hạ', 20, 800, 50, 1),
('Sông Hương', 10, 400, 25, 2),
('Sông Vu Gia', 30, 1000, 60, 3),
('Sông Thu Bồn', 25, 900, 55, 4);

-- Insert bảng Reservoir_Discharge (3 ngày đầu Jan 2024)
INSERT INTO Reservoir_Discharge (reservoir_id, date, inflow, release_flow, spillway_flow, hydro_use_flow)
VALUES
(1, '2024-01-01 00:00:00', 500, 300, 50, 250),
(1, '2024-01-02 00:00:00', 450, 280, 40, 240),
(1, '2024-01-03 00:00:00', 520, 310, 60, 250),
(2, '2024-01-01 00:00:00', 200, 120, 20, 100),
(2, '2024-01-02 00:00:00', 180, 110, 15, 95),
(2, '2024-01-03 00:00:00', 210, 130, 25, 105),
(3, '2024-01-01 00:00:00', 400, 250, 50, 200),
(3, '2024-01-02 00:00:00', 420, 260, 40, 220),
(3, '2024-01-03 00:00:00', 390, 240, 45, 195),
(4, '2024-01-01 00:00:00', 480, 300, 55, 245),
(4, '2024-01-02 00:00:00', 460, 290, 50, 240),
(4, '2024-01-03 00:00:00', 500, 310, 60, 250);


INSERT INTO Rainfall_Runoff (river_id, date, rainfall_amount, duration, estimated_inflow)
VALUES
(1, '2024-01-01 00:00:00', 25, 6, 520),
(1, '2024-01-02 00:00:00', 10, 3, 480),
(1, '2024-01-03 00:00:00', 30, 8, 550),
(2, '2024-01-01 00:00:00', 12, 4, 210),
(2, '2024-01-02 00:00:00', 8, 2, 190),
(2, '2024-01-03 00:00:00', 15, 5, 220),
(3, '2024-01-01 00:00:00', 20, 5, 420),
(3, '2024-01-02 00:00:00', 18, 4, 400),
(3, '2024-01-03 00:00:00', 22, 6, 450),
(4, '2024-01-01 00:00:00', 23, 5, 500),
(4, '2024-01-02 00:00:00', 17, 4, 470),
(4, '2024-01-03 00:00:00', 28, 7, 530);


--  tính lại thể tích hồ chứa sau khi nhập bản ghi vào 



