package krsu.argen.controller;

import krsu.argen.model.*;
import krsu.argen.repository.ListSongRepository;
import krsu.argen.repository.PlaylistRepository;
import krsu.argen.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Controller
@RequestMapping("playlist")
public class PlaylistController {

    private final SongRepository songRepository;
    private final PlaylistRepository playlistRepository;
    private final ListSongRepository listSongRepository;

    public PlaylistController(SongRepository songRepository, PlaylistRepository playlistRepository, ListSongRepository listSongRepository) {
        this.songRepository = songRepository;
        this.playlistRepository = playlistRepository;
        this.listSongRepository = listSongRepository;
    }

    @GetMapping("/playlist")
    public ModelAndView playlist(@AuthenticationPrincipal User user) {
        Iterable<Song> songIterable;
        Iterable<Playlist> playlistList;
        Iterable<Song> allSongs = songRepository.findAll();
        if (user.isAdmin()) {
            songIterable = songRepository.findAll();
            playlistList = playlistRepository.findAll();

        } else {
            songIterable = songRepository.findByAuthor(user);
            playlistList = playlistRepository.findByAuthor(user);
        }

        List<Song> sortedSong = StreamSupport.stream(songIterable.spliterator(), false)
                .sorted()
                .collect(Collectors.toList());
        List<Playlist> sortedPlaylist = StreamSupport.stream(playlistList.spliterator(), false)
                .sorted()
                .collect(Collectors.toList());

        List<Song> sortedAddPlaylist = StreamSupport.stream(allSongs.spliterator(), false)
                .sorted()
                .collect(Collectors.toList());
        return new ModelAndView("playlist")
                .addObject("Song", sortedSong)
                .addObject("Song1", sortedAddPlaylist)
                .addObject("playlistList", sortedPlaylist);
    }

    @GetMapping("/mySongs")
    public ModelAndView edit(@AuthenticationPrincipal User user) {
        Iterable<Song> songIterable = songRepository.findByAuthor(user);

        List<Song> sortedSong = StreamSupport.stream(songIterable.spliterator(), false)
                .sorted()
                .collect(Collectors.toList());
        return new ModelAndView("mySongs")
                .addObject("MySong", sortedSong);
    }

    @PostMapping("playlist")
    public String addPlaylist(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam(required = false) String description,
            Map<String, Object> model) {

        Playlist playlist = new Playlist(name, description, user);
        playlistRepository.save(playlist);

        Iterable<Playlist> playlistIterable = playlistRepository.findByAuthor(user);
        model.put("playlistList", playlistIterable);

        return "playlist";
    }

    @PostMapping("addPlaylist")
    public String addSong(
            @RequestParam String namePlaylist,
            @RequestParam String nameSong,
            Map<String, Object> model) {

        List<Song> songList = songRepository.findByName(nameSong);
        Playlist playlist = playlistRepository.findByName(namePlaylist);
        Song song = songList.get(0);

        ListSong listSong = new ListSong();

        listSong.setPlaylist(playlist);
        listSong.setSong(song);

        listSongRepository.save(listSong);

        /*List<Playlist> playlistIterable = playlistRepository.findAll();
        playlistRepository.save(playlist);*/

        model.put("addSongs", "Successfully added!");

        return "playlist";
    }

    @PostMapping("deletePlaylist")
    @Transactional
    public String deletePlaylist(
            @RequestParam String name,
            Map<String, Object> model) {

        playlistRepository.deleteByName(name);
        model.put("PlDelete", "Successfully delete!");

        return "playlist";
    }

    @PostMapping("filterPlaylist")
    public String filter(
            @AuthenticationPrincipal User user,
            @RequestParam() String name,
            Map<String, Object> model) {
        Playlist playlist;
        if (name != null && !name.isEmpty()) {
            playlist = playlistRepository.findByName(name);
        } else {
            playlist = new Playlist("Not exist", "", user);
        }

        model.put("playFilter", playlist);
        return "playlist";
    }


    @PostMapping("deleteSong")
    public String deleteSong(
            @RequestParam String playlist,
            @RequestParam String name,
            Map<String, Object> model) {

        Playlist playlist1 = playlistRepository.findByName(playlist);
        List<Song> songList = songRepository.findByName(name);
        Song song = songList.get(0);
        listSongRepository.deleteByPlaylistAndSong(playlist1, song);
        model.put("PSDelete", "Successfully delete!");
        return "playlist";
    }

    @PostMapping("ListOfSong")
    public String listSongs(
            @RequestParam String playlistName,
            Map<String, Object> model) {

        List<Song> songs;

        try {
            //String playlistName;
            Playlist playlist1 = playlistRepository.findByName(playlistName);
            if (playlist1 != null) {
                songs = playlist1.getListSongs().stream()
                        .map(ListSong::getSong)
                        .collect(Collectors.toList());
            } else {
                throw new Exception("No such playlist.");
            }
        } catch (Exception ex) {
            model.put("ExcPlay", ex.getMessage());
            return "playlist";
        }

        model.put("songs", songs);
        return "playlist";
    }


}
