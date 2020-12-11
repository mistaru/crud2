package krsu.education.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Cache;
import javax.persistence.Entity;
import java.util.List;
import java.util.Set;

@Data
@Entity
@NoArgsConstructor
public class Playlist implements Comparable<Playlist> {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "playlist_id")
    private Long id;

    private String name;

    private String description;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "users_id")
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
