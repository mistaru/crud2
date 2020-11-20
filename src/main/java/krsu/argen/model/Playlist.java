package krsu.argen.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;
@Data
@Entity
@NoArgsConstructor
public class Playlist implements Comparable<Playlist> {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "playlist_id")
    private int id;

    private String name;

    private String description;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @OneToMany(mappedBy = "playlist")
    private Set<ListSong> listSongs;

    public Playlist(String name, String description, User author) {
        this.name = name;
        this.description = description;
        this.author = author;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }

    @Override
    public int compareTo(Playlist o) {
        return name.compareTo(o.name);
    }
}
