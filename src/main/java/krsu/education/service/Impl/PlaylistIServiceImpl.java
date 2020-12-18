package krsu.education.service.Impl;

import krsu.education.entity.Playlist;
import krsu.education.entity.User;
import krsu.education.repository.PlaylistRepository;
import krsu.education.service.PlaylistService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class PlaylistIServiceImpl implements PlaylistService {

    PlaylistRepository repo;

    public PlaylistIServiceImpl(PlaylistRepository repo) {
        this.repo = repo;
    }

    @Override
    public void save(Playlist playlist) {
        repo.save(playlist);
    }

    @Override
    public List<Playlist> findByAuthor(User name) {
        return repo.findByAuthor(name);
    }

    @Override
    public List<Playlist> findAll() {
        return repo.findAll();
    }

    @Override
    public Playlist findByName(String name) {
        return repo.findByName(name);
    }

    @Override
    public Playlist findById(Long id) {
        return repo.findById(id).get();
    }

    @Override
    public void deleteById(Long id) {
        repo.deleteById(id);
    }

}
