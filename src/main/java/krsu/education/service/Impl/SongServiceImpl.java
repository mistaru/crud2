package krsu.education.service.Impl;

import krsu.education.entity.Song;
import krsu.education.entity.User;
import krsu.education.repository.SongRepository;
import krsu.education.service.SongService;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import java.util.List;


@Service
public class SongServiceImpl implements SongService {

    private final SongRepository repo;

    public SongServiceImpl(@NotNull SongRepository repo) {
        this.repo = repo;
    }

    @Override
    public void deleteByNameAndSinger(String name, String singer) {
        repo.deleteByNameAndSinger(name, singer);
    }

    @Override
    public Song findByName(String name) {
        return repo.findByName(name);
    }

    @Override
    public Song findBySingerAndName(String singer, String name) {
        return repo.findBySingerAndName(singer, name);
    }

    @Override
    public List<Song> findBySinger(String singer) {
        return repo.findBySinger(singer);
    }

    @Override
    public List<Song> findByAlbum(String album) {
        return repo.findByAlbum(album);
    }

    @Override
    public List<Song> findByStyle(String style) {
        return repo.findByStyle(style);
    }

    @Override
    public List<Song> findByAuthor(User user) {
        return repo.findByAuthor(user);
    }

    @Override
    public List<Song> findAll() {
        return repo.findAll();
    }

    @Override
    public void save(Song song) {
        repo.save(song);
    }

}
