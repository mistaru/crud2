package krsu.argen.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@NoArgsConstructor
public class ListSong {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "list_song_id")
    @Setter
    @Getter
    private int id;

    @ManyToOne
    @JoinColumn(name = "playlist_id",nullable=false)
    @Setter
    @Getter
    private Playlist playlist;

    @ManyToOne
    @JoinColumn(name = "song_id",nullable=false)
    @Setter
    @Getter
    private Song song;

    public ListSong(Playlist playlist, Song song) {
        this.playlist = playlist;
        this.song = song;
    }
}
