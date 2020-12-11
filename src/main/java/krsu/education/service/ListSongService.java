package krsu.education.service;

import krsu.education.entity.ListSong;
import org.springframework.stereotype.Service;

@Service
public interface ListSongService {

    void save(ListSong listSong);

}
