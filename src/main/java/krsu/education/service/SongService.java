package krsu.education.service;

import krsu.education.entity.Song;
import krsu.education.entity.User;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

public interface SongService {

    List<Song> findByAuthor(User user);

    List<Song> findAll();

    void save(Song song);

    Song findById(Long id);

    void deleteById(Long id);

    Specification<Song> filterSearch(Song todo);

    List<Song> findAll(Specification<Song> specification);

}
