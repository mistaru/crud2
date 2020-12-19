package krsu.education.controller;

import krsu.education.entity.ListSong;
import krsu.education.entity.Playlist;
import krsu.education.entity.User;
import krsu.education.service.ListSongService;
import krsu.education.service.PlaylistService;
import krsu.education.service.SongService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/playlist")
public class PlaylistController {

    private final SongService songService;
    private final PlaylistService service;
    private final ListSongService listSongService;
    protected List<Playlist> playlistList;

    public PlaylistController(SongService songService, PlaylistService service, ListSongService listSongService) {
        this.songService = songService;
        this.service = service;
        this.listSongService = listSongService;
    }


    @GetMapping("/list")
    public ModelAndView playlist(@AuthenticationPrincipal User user) {

        if (user.isAdmin()) playlistList = service.findAll().stream()
                .sorted()
                .collect(Collectors.toList());
        else playlistList = service
                .findByAuthor(user)
                .stream()
                .sorted()
                .collect(Collectors.toList());

        return new ModelAndView("playlist-list")
                .addObject("playlistList", playlistList);
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
        model.addAttribute("Song", service.findById(id)
                .getListSongs().stream()
                .map(ListSong::getSong)
                .collect(Collectors.toList()));

        return "playlist-details";
    }


    @PostMapping("/addSongs/{id}")
    public String addSong(@PathVariable Long id,
                          @RequestParam String nameSong) {

        listSongService
                .save(new ListSong(service.findById(id)
                        , songService.findByName(nameSong)));

        return "redirect:/playlist/details/" + id;
    }


    @GetMapping("/delete/{id}")
    public String deletePlaylist(@PathVariable Long id) {

        service.deleteById(id);

        return "redirect:/playlist/list";
    }

}
