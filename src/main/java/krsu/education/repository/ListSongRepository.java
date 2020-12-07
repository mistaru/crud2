package krsu.education.repository;

import krsu.education.model.ListSong;
import krsu.education.model.Playlist;
import krsu.education.model.Song;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ListSongRepository extends JpaRepository<ListSong,Long> {
    List<ListSong> deleteByPlaylistAndSong(Playlist playlist,Song song);

}
