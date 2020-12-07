package krsu.education.repository;

import krsu.education.entity.Playlist;
import krsu.education.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlaylistRepository extends JpaRepository<Playlist, Long> {

    Playlist findByName(String name);

    void deleteByName(String name);

    List<Playlist> findByAuthor(User user);

}
