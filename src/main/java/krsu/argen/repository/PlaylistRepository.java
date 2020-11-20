package krsu.argen.repository;

import krsu.argen.model.Playlist;
import krsu.argen.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface PlaylistRepository extends JpaRepository<Playlist,Long> {
    Playlist findByName(String name);
    List<Playlist> deleteByName(String name);
    List<Playlist> findByAuthor(User user);
}
