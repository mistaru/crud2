alter table if exists
    playlist add constraint
    UK9x6jap8m5ep2vm4o4l8ihmeav unique (name, users_id);

alter table if exists
    song add constraint
    UKegmn7st0qbmkywpepyw72lrb4 unique (singer, album);

alter table if exists
    song add constraint
    UK_bqvfw7w742f9fpp2nkxslu1y unique (album);

alter table if exists
    song add constraint
    UK_ppq4obrbpch7bdpmdx0uletfm unique (singer);

alter table if exists
    list_song add constraint
    FK8l8hgjklm8q4pud6siwe7kcvl foreign key (playlist_id) references playlist;

alter table if exists
    list_song add constraint
    FK5a5kmqeljawaxkcem3eickrr5 foreign key (song_id) references song;

alter table if exists
    playlist add constraint
    FKf9y2v02n3mue4m3iwwhihm3c9 foreign key (users_id) references users;

alter table if exists
    song add constraint
    FK95qhda60vc8q08toxt1j296fg foreign key (users_id) references users;

alter table if exists
    users_role add constraint
    FKiu0xsee0dmwa28nffgyf4bcvc foreign key (users_id) references users;