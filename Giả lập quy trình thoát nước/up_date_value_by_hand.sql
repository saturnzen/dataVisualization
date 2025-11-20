drop procedure update_current_volume;

update Reservoir_Discharge set current_volume = null;

INSERT INTO Reservoir_Discharge
(reservoir_id, date, inflow, release_flow, spillway_flow, hydro_use_flow, current_volume)
VALUES
(1, '2025-11-16 00:00:00', 500, 310, 60, 250, 350000000),
(1, '2023-12-31 00:00:00', 500, 310, 60, 250, 350000000);


DELIMITER $$

CREATE PROCEDURE update_current_volume()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_reservoir_id INT;
    DECLARE v_time DATETIME;
    DECLARE v_inflow DOUBLE;
    DECLARE v_release DOUBLE;
    DECLARE v_spillway DOUBLE;
    DECLARE v_hydro DOUBLE;
    DECLARE v_last_volume DOUBLE DEFAULT 0;
    DECLARE cur CURSOR FOR 
        SELECT reservoir_id, date, inflow, release_flow, spillway_flow, hydro_use_flow
        FROM Reservoir_Discharge
        ORDER BY reservoir_id, date;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_reservoir_id, v_time, v_inflow, v_release, v_spillway, v_hydro;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Cập nhật current_volume
        UPDATE Reservoir_Discharge
        SET current_volume = v_last_volume + (v_inflow - (v_release + v_spillway + v_hydro)) * 3600
        WHERE reservoir_id = v_reservoir_id AND date = v_time;

        -- Lưu lại volume cho lần tiếp theo
        SET v_last_volume = v_last_volume + (v_inflow - (v_release + v_spillway + v_hydro)) * 3600;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;



--  bản cải tiến

DELIMITER $$

CREATE PROCEDURE update_current_volume()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_reservoir_id INT;
    DECLARE v_last_date TIMESTAMP;
    DECLARE v_date TIMESTAMP;
    DECLARE v_inflow DOUBLE;
    DECLARE v_release DOUBLE;
    DECLARE v_spillway DOUBLE;
    DECLARE v_hydro DOUBLE;
    DECLARE v_last_volume DOUBLE DEFAULT NULL;
    DECLARE v_last_reservoir_id INT DEFAULT NULL;

    DECLARE cur CURSOR FOR 
        SELECT reservoir_id, date, inflow, release_flow, spillway_flow, hydro_use_flow
        FROM reservoir_discharge_sample
        ORDER BY reservoir_id, date;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_reservoir_id, v_date, v_inflow, v_release, v_spillway, v_hydro;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Reset v_last_volume nếu chuyển reservoir mới
        IF v_last_reservoir_id IS NULL OR v_last_reservoir_id <> v_reservoir_id THEN
            SET v_last_volume = NULL;
        END IF;

        -- Nếu v_last_volume NULL thì lấy giá trị mốc của bản ghi đầu tiên
        IF v_last_volume IS NULL THEN
            SELECT current_volume INTO v_last_volume
            FROM reservoir_discharge_sample
            WHERE reservoir_id = v_reservoir_id AND date = v_date;
        ELSE
            UPDATE reservoir_discharge_sample
            SET current_volume = v_last_volume + (v_inflow - (v_release + v_spillway + v_hydro)) * TIMESTAMPDIFF(SECOND, v_last_date, v_date)
            WHERE reservoir_id = v_reservoir_id AND date = v_date;

            SET v_last_volume = v_last_volume + (v_inflow - (v_release + v_spillway + v_hydro)) * TIMESTAMPDIFF(SECOND, v_last_date, v_date);
        END IF;

        SET v_last_date = v_date;
        SET v_last_reservoir_id = v_reservoir_id;

    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;


CALL update_current_volume();



