package krsu.argen.repository;

import krsu.argen.model.ListSong;
import krsu.argen.model.Playlist;
import krsu.argen.model.Song;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ListSongRepository extends JpaRepository<ListSong,Long> {
    List<ListSong> deleteByPlaylistAndSong(Playlist playlist,Song song);

}
