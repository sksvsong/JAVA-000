--	第13课 2、（必做）按自己设计的表结构，插入10万订单模拟数据，测试不同方式的插入效率。

-- # 关闭自动提交，批量插入
DROP PROCEDURE IF EXISTS orders_intput_data;
DELIMITER $
CREATE PROCEDURE orders_intput_data()
BEGIN
    DECLARE i INT DEFAULT 1;
    set autocommit=0;
    WHILE i<=1000000 DO
            insert into db.orders (user_id, commodities, status, deliver_status, total_price, create_time, update_time)
            VALUES (CEILING(rand()*100), '{"key": "value"}', 0, '{"key":"value"}', 1, unix_timestamp(now()) , unix_timestamp(now()));
        SET i = i+1;
    END WHILE;
    commit;
END $
CALL orders_intput_data();

-- # 自动提交，一条一条插入
DROP PROCEDURE IF EXISTS orders_intput_data_one;
DELIMITER $
CREATE PROCEDURE orders_intput_data_one()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i<=1000000 DO
            insert into db.orders (user_id, commodities, status, deliver_status, total_price, create_time, update_time)
            VALUES (CEILING(rand()*100), '{"key": "value"}', 0, '{"key":"value"}', 1, unix_timestamp(now()) , unix_timestamp(now()));
        SET i = i+1;
    END WHILE;
END $
CALL orders_intput_data_one();