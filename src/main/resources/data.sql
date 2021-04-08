insert into role (name) values ('ROLE_ADMIN');
insert into role (name) values ('ROLE_USER' );

--default login: user:administrator pw: administrator
insert into user_account (active, email, password, username, role_id) values (true, 'test@test.com', '$2a$10$qQn/YI3iGA/iOaNqxqQ5HeYKIOyUEcemGLGuKFyyCWaIgfBDWEx9a', 'administrator', 1);
insert into product (consumed_before, manufacturing_date, manufacturing_origin, name, weight, user_id) values ('2021-04-21', '2021-04-14', 'Thai', 'Oil Coconut 100ML', 100.0, 1);
insert into product (consumed_before, manufacturing_date, manufacturing_origin, name, weight, user_id) values ('2021-04-21', '2021-04-14', 'Taiwan', 'Oil Coconut 200ML', 200.0, 1);
--insert into lot (global_weight, quantity, sending_date, product_id) values (250.0, 50, '2021-04-07', 1);