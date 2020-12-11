package krsu.education.service;

import krsu.education.entity.Playlist;
import krsu.education.entity.User;

import java.util.List;

public interface PlaylistService {

    void save(Playlist playlist);

    List<Playlist> findByAuthor(User name);

    List<Playlist> findAll();

    Playlist findByName(String name);

    Playlist findById(Long id);

    void deleteById(Long id);

}
