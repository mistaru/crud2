package krsu.education.controller;

import krsu.education.entity.Song;
import krsu.education.entity.User;
import krsu.education.service.SongService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/song")
public class SongController {

    private final SongService service;

    public SongController(@NotNull SongService service) {
        this.service = service;
    }


    @GetMapping("/list")
    public ModelAndView songs() {

        return new ModelAndView("song")
                .addObject("Song", service.findAll()
                        .stream()
                        .sorted()
                        .collect(Collectors.toList()));
    }


    @GetMapping("/my-list")
    public ModelAndView mySongs(@AuthenticationPrincipal User user) {

        return new ModelAndView("song")
                .addObject("Song", service.findByAuthor(user)
                        .stream()
                        .sorted()
                        .collect(Collectors.toList()));
    }


    @GetMapping("/edit/{id}")
    public String editSong(@PathVariable Long id, Model model) {
    Song song = service.findById(id);

        model.addAttribute("song", service.findById(id));
        return "song-form";

    }


    @GetMapping("/add")
    public String newSong(Model model) {

        model.addAttribute("song", new Song());
        return "song-form";

    }


    @PostMapping("/new")
    public String newSong(
            @AuthenticationPrincipal User user,
            Song song) {

        song.setAuthor(user);
        service.save(song);
        return "redirect:/song/my-list";

    }


    @PostMapping("/delete/{id}")
    @Transactional
    public String delete(@PathVariable Long id) {

        service.deleteById(id);
        return "redirect:song/my-list";

    }


    @RequestMapping("/find/list2")
    public String list2(Song song, Model model) {

        List<Song> list = service.findAll(service.filterSearch(song));

        model.addAttribute("list2", list);
        return "song";
    }


/*    @PostMapping("/editSong")
    public String updateSong(
            @RequestParam String nameEdit,
            @RequestParam String name,
            @RequestParam(required = false) String singer,
            @RequestParam(required = false) String album,
            @RequestParam(required = false) String style,
            Map<String, Object> model) {

        Song song = service.findByName(nameEdit);
        song.setName(name);
        song.setSinger(singer);
        song.setAlbum(album);
        song.setStyle(style);
        service.save(song);

        Iterable<Song> songIterable = service.findAll();
        model.put("SongUser", songIterable);

        return "editSong";
    }*/


}
