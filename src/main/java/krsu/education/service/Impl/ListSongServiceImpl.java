package krsu.education.service.Impl;

import krsu.education.entity.ListSong;
import krsu.education.repository.ListSongRepository;
import krsu.education.service.ListSongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ListSongServiceImpl implements ListSongService {

    ListSongRepository  repo;

    @Autowired
    public ListSongServiceImpl(ListSongRepository repo) {
        this.repo = repo;
    }

    @Override
    public void save(ListSong listSong) {
        repo.save(listSong);
    }

    @Override
    public void deleteById(Long id) {
        repo.deleteById(id);
    }
}
