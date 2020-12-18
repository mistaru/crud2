insert into users (id, active, password, username) values (255, 'true', 'admin', 'admin');
insert into users (id, active, password, username) values (256, 'true', 12, 'olga');

insert into users_role (users_id,roles) values (255, 'ADMIN');
insert into users_role (users_id,roles) values (256, 'USER');