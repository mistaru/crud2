package krsu.argen.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ListSongDTO {
    private String name;
    private String singer;
    private String album;
    private String style;
}
