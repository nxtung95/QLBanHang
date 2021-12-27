INSERT INTO users (name, birthday, address, username, password)
VALUES (N'Nguyễn Văn A', GETDATE(), 'HCM', 'quanlytrungtam', 'test1234'),
(N'Nguyễn Văn B', GETDATE(), 'HN', 'quanlycuahang1', 'test1234'),
(N'Nguyễn Văn C', GETDATE(), 'DN', 'quanlycuahang2', 'test1234'),
(N'Nguyễn Văn D', GETDATE(), 'DL', 'nhanviencuahang1', 'test1234'),
(N'Nguyễn Văn E', GETDATE(), 'HN', 'nhanviencuahang2', 'test1234');

INSERT INTO role(role)
VALUES ('QUANLY_TRUNGTAM'),
('QUANLY_CUAHANG'),
('NHAN_VIEN');
-- delete from users;
-- DBCC CHECKIDENT (users, RESEED, 0)

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
