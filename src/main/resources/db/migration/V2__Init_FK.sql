
alter table if exists list_song add constraint
    list_song_playlist foreign key (playlist_id) references playlist;


alter table if exists list_song add constraint
    list_song_song foreign key (song_id) references song;


alter table if exists playlist add constraint
    playlist_users foreign key (users_id) references users;


alter table if exists song add constraint
    song_users foreign key (users_id) references users;


alter table if exists users_role add constraint
    users_role_users foreign key (users_id) references users;