package krsu.education.repository;

import krsu.education.entity.Song;
import krsu.education.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongRepository extends JpaRepository<Song, Long>, JpaSpecificationExecutor<Song> {

    void deleteByNameAndSinger(String name, String singer);

    Song findByName(String name);

    Song findById(long id);

    void deleteById(Long id);

    Song findBySingerAndName(String singer, String name);

    List<Song> findBySinger(String singer);

    List<Song> findByAlbum(String album);

    List<Song> findByStyle(String style);

    List<Song> findByAuthor(User user);

}
