package krsu.argen.repository;

import krsu.argen.model.Song;
import krsu.argen.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SongRepository extends JpaRepository<Song,Long> {
    List<Song> deleteByNameAndSinger(String name, String singer);
    List<Song> findByName(String name);
    Song findBySingerAndName(String singer, String name);
    List<Song> findBySinger(String singer);
    List<Song> findByAlbum(String album);
    List<Song> findByStyle(String style);
    List<Song> findByAuthor(User user);


}
