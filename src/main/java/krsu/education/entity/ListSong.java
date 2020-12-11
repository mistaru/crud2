package krsu.education.entity;

import lombok.Data;
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
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "list_song_id")
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "playlist_id",nullable=false)
    private Playlist playlist;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "song_id",nullable=false)
    private Song song;

    public ListSong(Playlist playlist, Song song) {
        this.playlist = playlist;
        this.song = song;
    }

}
