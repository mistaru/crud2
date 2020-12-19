create sequence hibernate_sequence start 1 increment 1;

create table
list_song
(list_song_id int8 not null,
playlist_id int8 not null,
song_id int8 not null,
primary key (list_song_id));


create table
playlist
(playlist_id int8 not null,
description varchar(255),
name varchar(255),
users_id int8,
primary key (playlist_id));

create table
song
(song_id int8 not null,
album varchar(255),
name varchar(255),
singer varchar(255),
style varchar(255),
users_id int8,
primary key (song_id));

create table
users
(id int8 not null,
active boolean not null,
password varchar(255),
username varchar(255),
primary key (id));

create table
users_role
(users_id int8 not null,
roles varchar(255));