package krsu.education.repository;

import krsu.education.entity.ListSong;
import krsu.education.entity.Playlist;
import krsu.education.entity.Song;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ListSongRepository extends JpaRepository<ListSong, Long> {

    void deleteByPlaylistAndSong(Playlist playlist, Song song);

}
