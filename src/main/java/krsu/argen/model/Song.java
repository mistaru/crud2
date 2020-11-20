package krsu.argen.model;

import lombok.*;
import javax.persistence.*;
import java.util.Set;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Song implements Comparable<Song>{
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "song_id", insertable = false, updatable = false)
    private int id;

    @Column
    private String name;

    @Column
    private String singer;

    @Column
    private String album;

    @Column
    private String style;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @OneToMany(mappedBy = "song")
    private Set<ListSong> listSongs;

    public Song(String name, String singer, String album, String style, User author) {
        this.name = name;
        this.singer = singer;
        this.album = album;
        this.style = style;
        this.author = author;
    }
    @Override
    public int compareTo(Song o) {
        return name.compareTo(o.name);
    }

    public User getAuthor() {
        return author;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }

    public String getName() {
        if (name != null) {
            return name;
        }
        return "";
    }

    public String getSinger() {
        if (singer != null) {
            return singer;
        }
        return "";
    }

    public String getAlbum() {
        if (album != null) {
            return album;
        }
        return "";

    }

    public String getStyle() {
        if (style != null) {
            return style;
        }
        return "";
    }
}
