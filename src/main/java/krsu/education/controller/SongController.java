package krsu.education.controller;

import krsu.education.entity.Song;
import krsu.education.entity.User;
import krsu.education.service.SongService;
import org.springframework.dao.DataIntegrityViolationException;
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

        return new ModelAndView("song-list")
                .addObject("Song", service.findAll()
                        .stream()
                        .sorted()
                        .collect(Collectors.toList()));
    }


    @GetMapping("/my-list")
    public ModelAndView mySongs(@AuthenticationPrincipal User user) {

        return new ModelAndView("song-my-list")
                .addObject("Song", service.findByAuthor(user)
                        .stream()
                        .sorted()
                        .collect(Collectors.toList()));
    }


    @GetMapping("/edit/{id}")
    public String editSong(@PathVariable Long id, Model model) {

        model.addAttribute("song", service.findById(id));
        return "song-form";

    }


    @GetMapping("/add")
    public String newSong(Model model) {

        model.addAttribute("song", new Song());
        return "song-add";

    }


    @PostMapping("/new")
    public String newSong(@AuthenticationPrincipal User user, Song song) {
        try {
            song.setAuthor(user);
            service.save(song);
            return "redirect:/song/my-list";
        } catch (DataIntegrityViolationException e) {
            e.printStackTrace();
            return "redirect:/song/add";
        }
    }


    @GetMapping("/delete/{id}")
    @Transactional
    public String delete(@PathVariable Long id) {

        service.deleteById(id);
        return "redirect:/song/my-list";

    }


    @RequestMapping("/find/list1")
    public String list1(Song song, Model model) {

        List<Song> list = service.findAll(service.filterSearch(song));

        model.addAttribute("Song", list);
        return "song-list";
    }

}
