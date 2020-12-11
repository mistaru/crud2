package krsu.education.controller;

import krsu.education.entity.ListSong;
import krsu.education.entity.Playlist;
import krsu.education.entity.Song;
import krsu.education.entity.User;
import krsu.education.service.ListSongService;
import krsu.education.service.PlaylistService;
import krsu.education.service.SongService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/playlist")
public class PlaylistController {

    private final SongService songService;
    private final PlaylistService service;
    private final ListSongService listSongService;
    protected List<Song> songList;
    protected List<Playlist> playlistList;

    public PlaylistController(SongService songService, PlaylistService service, ListSongService listSongService) {
        this.songService = songService;
        this.service = service;
        this.listSongService = listSongService;
    }

    @GetMapping("/list")
    public ModelAndView playlist(@AuthenticationPrincipal User user) {

        return new ModelAndView("playlist-list")
                .addObject("playlistList",
                        playlistList = service
                                .findByAuthor(user)
                                .stream()
                                .sorted()
                                .collect(Collectors.toList()));
    }


    @GetMapping("/edit/{id}")
    public String editSong(@PathVariable Long id, Model model) {

        model.addAttribute("playlist", service.findById(id));
        return "playlist-form";

    }


    @PostMapping("/add")
    public String addPlaylist(@AuthenticationPrincipal User user, Playlist playlist) {

        playlist.setAuthor(user);
        service.save(playlist);

        return "redirect:/playlist/list";
    }


    @GetMapping("/new")
    public String newPlaylist(Model model) {

        model.addAttribute("playlist", new Playlist());

        return "playlist-add";
    }


    @GetMapping("/details/{id}")
    public String playlistDetails(Model model, @PathVariable Long id) {

        model.addAttribute("playlist", service.findById(id));
        model.addAttribute("Songs", songService.findAll());
        model.addAttribute("Song", service.findById(id).getListSongs().stream()
                .map(ListSong::getSong)
                .collect(Collectors.toList()));

        return "playlist-details";
    }


    @PostMapping("/addSongs/{id}")
    public String addSong(@PathVariable Long id,
                          @RequestParam String nameSong) {

        listSongService
                .save(new ListSong(service.findById(id)
                ,songService.findByName(nameSong)));

        return "redirect:/playlist/details/" + id;
    }


    @PostMapping("deletePlaylist")
    @Transactional
    public String deletePlaylist(
            @RequestParam Long id,
            Map<String, Object> model) {

        service.deleteById(id);
        model.put("PlDelete", "Successfully delete!");

        return "playlist-list";
    }

}
