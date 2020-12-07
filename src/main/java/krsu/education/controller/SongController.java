package krsu.education.controller;

import krsu.education.entity.Song;
import krsu.education.entity.User;
import krsu.education.service.SongService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;
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
                .addObject("SongUser", service.findByAuthor(user)
                        .stream()
                        .sorted()
                        .collect(Collectors.toList()));
    }


    @GetMapping("/edit")
    public ModelAndView edit(@AuthenticationPrincipal User user) {

        List<Song> songIterable;

        if (user.isAdmin()) {
            songIterable = service.findAll();
        } else {
            songIterable = service.findByAuthor(user);
        }

        return new ModelAndView("editSong")
                .addObject("SongEdit", songIterable.stream()
                        .sorted()
                        .collect(Collectors.toList()));
    }

    @PostMapping("/song")
    public String addSong(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam(required = false) String singer,
            @RequestParam(required = false) String album,
            @RequestParam(required = false) String style,
            Map<String, Object> model) {

        Song song = new Song(name, singer, album, style, user);
        service.save(song);
        model.put("SongAdd", "Song '" + song.getName() + "' successfully added!");

        Iterable<Song> songIterable = service.findAll();
        model.put("Song", songIterable);

        return "song";
    }

    @PostMapping("delete")
    @Transactional
    public String delete(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam(required = false) String singer,
            Map<String, Object> model) {

        Song song = service.findBySingerAndName(singer, name);
        if (name == null)
            throw new IllegalArgumentException("Нету такой песни");

        if (user.getUsername().contains(song.getAuthorName()) || user.isAdmin()) {
            service.deleteByNameAndSinger(name, singer);
            model.put("SongAdd", "Song '" + song.getName() + "' successfully delete!");

            List<Song> songList = service.findAll();
            model.put("Song", songList);
        } else
            model.put("SongExc", "Нет прав на удаление");

        model.put("Song", service.findAll());

        return "song";
    }

    @PostMapping("filter")
    public String filter(
            @RequestParam(required = false) String criterion,
            @RequestParam(required = false) String filter,
            Map<String, Object> model) {
        Iterable<Song> songIterable;

        switch (criterion) {

            case "name":
                songIterable = (Iterable<Song>) service.findByName(filter);
                break;
            case "singer":
                songIterable = service.findBySinger(filter);
                break;
            case "album":
                songIterable = service.findByAlbum(filter);
                break;
            case "style":
                songIterable = service.findByStyle(filter);
                break;
            default:
                songIterable = service.findAll();
                break;
        }
        model.put("Song", songIterable);
        return "song";
    }

    @PostMapping("/editSong")
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
    }


}
