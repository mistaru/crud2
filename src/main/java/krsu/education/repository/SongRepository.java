package krsu.education.repository;

import krsu.education.entity.Song;
import krsu.education.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongRepository extends JpaRepository<Song, Long>, JpaSpecificationExecutor<Song> {

    Song findByName(String name);

    void deleteById(Long id);

    List<Song> findByAuthor(User user);

}
