package krsu.education.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
@Table(uniqueConstraints = {@UniqueConstraint(columnNames = {"name", "singer", "album"})})
@NoArgsConstructor
@AllArgsConstructor
public class Song implements Comparable<Song> {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "song_id", insertable = false, updatable = false)
    private Long id;

    @Column
    private String name;

    @Column(unique = true)
    private String singer;

    @Column(unique = true)
    private String album;

    @Column
    private String style;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "users_id")
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
