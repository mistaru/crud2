package krsu.education.service;

import krsu.education.entity.Song;
import krsu.education.entity.User;

import java.util.Arrays;
import java.util.List;

public interface SongService {

    void deleteByNameAndSinger(String name, String singer);

    Song findByName(String name);

    Song findBySingerAndName(String singer, String name);

    List<Song> findBySinger(String singer);

    List<Song> findByAlbum(String album);

    List<Song> findByStyle(String style);

    List<Song> findByAuthor(User user);

    List<Song> findAll();

    void save(Song song);
}
