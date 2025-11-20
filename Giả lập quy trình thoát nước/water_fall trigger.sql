ALTER TABLE Reservoir_Discharge
ADD COLUMN current_volume DOUBLE;

drop trigger calc_current_volume;

DELIMITER $$

CREATE TRIGGER calc_current_volume
BEFORE INSERT ON Reservoir_Discharge
FOR EACH ROW
BEGIN
    DECLARE last_volume DOUBLE;

    -- Lấy thể tích hồ từ bản ghi cuối cùng
    SELECT current_volume INTO last_volume
    FROM Reservoir_Discharge
    WHERE reservoir_id = NEW.reservoir_id
    ORDER BY date DESC
    LIMIT 1;

    IF last_volume IS NULL THEN
        SET last_volume = 0; -- hoặc giá trị mực nước chết
    END IF;

    -- Tính thể tích hồ hiện tại
    SET NEW.current_volume = last_volume
        + (NEW.inflow - (NEW.release_flow + NEW.spillway_flow + NEW.hydro_use_flow)) * 3600; 
        -- 3600 là số giây nếu inflow và xả tính theo m³/s, ghi nhận mỗi giờ
END;
$$

DELIMITER ;





