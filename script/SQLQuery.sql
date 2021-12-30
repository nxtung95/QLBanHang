INSERT INTO users (name, birthday, address, username, password)
VALUES (N'Nguyễn Văn A', GETDATE(), 'HCM', 'quanlytrungtam', 'test1234'),
(N'Nguyễn Văn B', GETDATE(), 'HN', 'quanlycuahang1', 'test1234'),
(N'Nguyễn Văn C', GETDATE(), 'DN', 'quanlycuahang2', 'test1234'),
(N'Nguyễn Văn D', GETDATE(), 'DL', 'nhanviencuahang1', 'test1234'),
(N'Nguyễn Văn E', GETDATE(), 'HN', 'nhanviencuahang2', 'test1234');

UPDATE users SET password = '047834ad92f6227c76c2c8c20b88c023' where id = 1;
UPDATE users SET password = '9b5e81a9f93bd70ef5f20ca8df003e2d' where id = 2;
UPDATE users SET password = '4e458c0caf34f031ea59777eb7988c08' where id = 3;
UPDATE users SET password = 'a7b8ab067a1acd19c682278378a4a8ba' where id = 4;
UPDATE users SET password = 'b633b2c605f2062802a161645dc6d866' where id = 5;
-- DBCC CHECKIDENT (users, RESEED, 0)

INSERT INTO role(role)
VALUES ('QUANLY_TRUNGTAM'),
('QUANLY_CUAHANG'),
('NHAN_VIEN');

INSERT INTO center_manager(user_id) VALUES (1);

INSERT INTO store_manager(user_id) VALUES (2), (3);

INSERT INTO staff(user_id, staff_no, rank) 
VALUES (4, 'NV1', 3), 
(5, 'NV2', 2);

INSERT INTO user_role(role_id, user_id) 
VALUES(1, 1),
(2, 2),
(2, 3),
(3, 2),
(3, 3),
(3, 4),
(3, 5);

insert into work_time(type, start_time, end_time, description)
VALUES(1, '06:00:00', '14:00:00', 'CA SANG'),
(2, '14:00:00', '22:00:00', 'CA CHIEU'),
(3, '22:00:00', '06:00:00', 'CA DEM');

insert into customer(id, name, birthday, address)
VALUES('KH1', 'Khach Hang A', '1985-06-12', 'TP HCM'),
('KH2', 'Khach Hang B', '1995-01-30', 'HN');

insert into invoice(id, customer_id, user_id, sale_date, discount, total_price)
VALUES('INVOICE1', 'KH1', 4, '2021-12-30 16:30:55', 0, 150.000),
('INVOICE2', 'KH1', 4, '2021-12-30 15:22:25', 0, 250.000),
('INVOICE3', 'KH1', 4, '2021-12-30 21:34:22', 0, 50.000);

insert into product(id, name, price)
VALUES('PRODUCT1', 'Bim bim', 5.000),
('PRODUCT2', 'Kep toc', 12.000),
('PRODUCT3', 'Giay an', 6.500),
('PRODUCT4', 'Khan mat', 15.000),
('PRODUCT5', 'Mi goi', 10.000);

insert into detail_invoice(product_id, invoice_id, quantity, price)
VALUES('PRODUCT1', 'INVOICE1', 10, 50.000),
('PRODUCT2', 'INVOICE1', 5, 60.000),
('PRODUCT5', 'INVOICE1', 4, 40.000),
('PRODUCT4', 'INVOICE2', 10, 150.000),
('PRODUCT3', 'INVOICE2', 10, 65.000),
('PRODUCT5', 'INVOICE2', 3, 35.000),
('PRODUCT1', 'INVOICE3', 10, 50.000);