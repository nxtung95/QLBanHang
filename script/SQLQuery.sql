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
