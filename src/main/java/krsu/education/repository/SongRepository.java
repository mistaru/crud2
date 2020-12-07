package krsu.education.repository;

import krsu.education.entity.Song;
import krsu.education.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SongRepository extends JpaRepository<Song, Long> {

    void deleteByNameAndSinger(String name, String singer);

    Song findByName(String name);

    Song findBySingerAndName(String singer, String name);

    List<Song> findBySinger(String singer);

    List<Song> findByAlbum(String album);

    List<Song> findByStyle(String style);

    List<Song> findByAuthor(User user);

}