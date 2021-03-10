package krsu.education.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@Setter
@Getter
public class ListSong {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "list_song_sequence")
    @SequenceGenerator(name = "list_song_sequence", sequenceName = "list_song_seq", allocationSize = 1)
    @Column(name = "list_song_id")
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    @JoinColumn(name = "playlist_id",nullable=false)
    private Playlist playlist;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "song_id",nullable=false)
    private Song song;

    public ListSong(Playlist playlist, Song song) {
        this.playlist = playlist;
        this.song = song;
    }

}
