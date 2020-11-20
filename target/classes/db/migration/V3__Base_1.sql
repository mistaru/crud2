/*insert into usr (id, active, password, username) values (1, 'true', 1, 'admin');
insert into usr (id, active, password, username) values (2, 'true', 12, 'masha');
insert into usr (id, active, password, username) values (3, 'true', 123, 'pasha');

    insert into user_role (user_id,roles) values (1, 'ADMIN');
    insert into user_role (user_id,roles) values (2, 'USER');

insert into playlist (playlist_id, name, description,user_id) values (1, 'Love', 'Here are collected favorite songs', 1);
insert into playlist (playlist_id, name, description,user_id) values (2, 'Русский рок', 'Знаменитый русский рок-н-рол', 2);

insert into song (song_id, name, singer, album, style,user_id) values (1,  'Life',             'Zivert',           'Home',   'Pop',     1);
insert into song (song_id, name, singer, album, style,user_id) values (2,  'Dance Monkey',     'Bad Zu',           'Life',   'Rap',     2);
insert into song (song_id, name, singer, album, style,user_id) values (3,  'Credo',            'Jony',             'Jamm',   'Rock',    3);
insert into song (song_id, name, singer, album, style,user_id) values (4,  'Комета',           'Rammstein',        'X-ray',  'Hip-Hop', 1);
insert into song (song_id, name, singer, album, style,user_id) values (5,  'Любимка',          'Billie Eilish',    'Комета', 'Pop',     2);
insert into song (song_id, name, singer, album, style,user_id) values (6,  'Trap Luv',         'Queen',            'Туман',  'Rap',     3);
insert into song (song_id, name, singer, album, style,user_id) values (7,  'bad guy',          'Linkin Park',      'Spring', 'Rock',    2);
insert into song (song_id, name, singer, album, style,user_id) values (8,  'Прятки',           'Jah Khalib',       'Slivki', 'Hip-Hop', 3);
insert into song (song_id, name, singer, album, style,user_id) values (9,  'NBA',              'Little Big',       'Romanum','Pop',     2);
insert into song (song_id, name, singer, album, style,user_id) values (10, 'Beverly Hills',    'Мот',              'Home',   'Rap',     3);
insert into song (song_id, name, singer, album, style,user_id) values (11, 'Джадуа',           'Burito',           'Life',   'Rock',    2);
insert into song (song_id, name, singer, album, style,user_id) values (12, 'Пчеловод',         'Ed Sheeran',       'Jamm',   'Hip-Hop', 3);
insert into song (song_id, name, singer, album, style,user_id) values (13, 'Девочка в тренде', 'Sia',              'X-ray',  'Pop',     2);
insert into song (song_id, name, singer, album, style,user_id) values (14, 'Love Is',          'MARUV',            'Комета', 'Rap',     3);
insert into song (song_id, name, singer, album, style,user_id) values (15, 'Da Da Da',         'Twenty One Pilots','Туман',  'Rock',    2);
insert into song (song_id, name, singer, album, style,user_id) values (16, 'Лети',             'Zivert',           'Spring', 'Hip-Hop', 3);
insert into song (song_id, name, singer, album, style,user_id) values (17, 'In The End',       'Bad Zu',           'Slivki', 'Pop',     2);
insert into song (song_id, name, singer, album, style,user_id) values (18, 'Зацепила',         'Jony',             'Romanum','Rap',     3);
insert into song (song_id, name, singer, album, style,user_id) values (19, 'Прочь',            'Rammstein',        'Home',   'Rock',    2);
insert into song (song_id, name, singer, album, style,user_id) values (20, 'B.I.D',            'Billie Eilish',    'Life',   'Hip-Hop', 3);
insert into song (song_id, name, singer, album, style,user_id) values (21, 'Незабудка',        'Queen',            'Jamm',   'Pop',     2);
insert into song (song_id, name, singer, album, style,user_id) values (22, 'Сталактит',        'Linkin Park',      'X-ray',  'Rap',     3);
insert into song (song_id, name, singer, album, style,user_id) values (23, 'Двусмысленно',     'Jah Khalib',       'Комета', 'Rock',    2);
insert into song (song_id, name, singer, album, style,user_id) values (24, 'Холодок',          'Little Big',       'Туман',  'Hip-Hop', 3);
insert into song (song_id, name, singer, album, style,user_id) values (25, 'Ride It',          'Мот',              'Spring', 'Pop',     2);
insert into song (song_id, name, singer, album, style,user_id) values (26, 'Devil Eyes',       'Burito',           'Slivki', 'Rap',     3);
insert into song (song_id, name, singer, album, style,user_id) values (27, 'До-Ма',            'Ed Sheeran',       'Romanum','Rock',    2);
insert into song (song_id, name, singer, album, style,user_id) values (28, 'Смотри',           'Sia',              'Home',   'Hip-Hop', 3);
insert into song (song_id, name, singer, album, style,user_id) values (29, 'Лали',             'MARUV',            'Life',   'Pop',     2);
insert into song (song_id, name, singer, album, style,user_id) values (30, 'Аллея',            'Twenty One Pilots','Jamm',   'Rap',     3);
insert into song (song_id, name, singer, album, style,user_id) values (31, 'Тебя манят',       'Coldplay',         'X-ray',  'Rock',    2);
insert into song (song_id, name, singer, album, style,user_id) values (32, 'Life',             'Scorpions',        'Комета', 'Hip-Hop', 3);
insert into song (song_id, name, singer, album, style,user_id) values (33, 'Morze',            'Nirvana',          'Туман',  'Pop',     2);
insert into song (song_id, name, singer, album, style,user_id) values (34, 'Босая',            'Элджей',           'Spring', 'Rap',     3);
insert into song (song_id, name, singer, album, style,user_id) values (35, 'Lalala',           'MATRANG',          'Slivki', 'Rock',    2);
insert into song (song_id, name, singer, album, style,user_id) values (36, 'Антигерой',        'The Beatles',      'Romanum','Hip-Hop', 3);
insert into song (song_id, name, singer, album, style,user_id) values (37, 'Нирвана',          'T-Fest',           'Life',   'Pop',     2);
insert into song (song_id, name, singer, album, style,user_id) values (38, 'Кроссы',           'Нервы',            'Life',   'Rap',     3);
insert into song (song_id, name, singer, album, style,user_id) values (39, 'Мой океан',        'Lindemann',        'Life',   'Rock',    2);
insert into song (song_id, name, singer, album, style,user_id) values (40, 'Уставший город',   'Lx24',             'Life',   'Hip-Hop', 3);


*/