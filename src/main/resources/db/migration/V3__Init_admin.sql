insert into users (id, active, password, username) values (200, 'true', 'admin', 'admin');
insert into users (id, active, password, username) values (201, 'true', 'aidana', 'aidana');

insert into users_role (users_id,roles) values (200, 'ADMIN');
insert into users_role (users_id,roles) values (201, 'USER');