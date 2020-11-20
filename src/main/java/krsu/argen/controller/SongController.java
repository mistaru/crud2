package krsu.argen.controller;

import krsu.argen.model.Song;
import krsu.argen.model.User;
import krsu.argen.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Controller
public class SongController {
    @Autowired
    private SongRepository songRepository;

    @GetMapping("/song")
    public ModelAndView songs(@AuthenticationPrincipal User user) {
        Iterable<Song> songIterable = songRepository.findAll();
        List<Song> songList = songRepository.findByAuthor(user);
        List<Song> sortedSong = StreamSupport.stream(songIterable.spliterator(), false)
                .sorted()
                .collect(Collectors.toList());
        return new ModelAndView("song")
                .addObject("Song", sortedSong)
//                .addObject("Song", songIterable)
                .addObject("SongUser", songList);
    }

    @GetMapping("/editSong")
    public ModelAndView edit(@AuthenticationPrincipal User user) {
        Iterable<Song> songIterable;
        if (user.isAdmin()) {
            songIterable = songRepository.findAll();
        } else {
            songIterable = songRepository.findByAuthor(user);
        }

        List<Song> sortedSong = StreamSupport.stream(songIterable.spliterator(), false)
                .sorted()
                .collect(Collectors.toList());
        return new ModelAndView("editSong")
                .addObject("SongUser", sortedSong);
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
        songRepository.save(song);
        model.put("SongAdd", "Song '" +song.getName() +"' successfully added!");

        Iterable<Song> songIterable = songRepository.findAll();
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

        Song song = songRepository.findBySingerAndName(singer, name);
        if (name == null)
            throw new IllegalArgumentException("Нету такой песни");

        if (user.getUsername().contains(song.getAuthorName()) || user.isAdmin()) {
            songRepository.deleteByNameAndSinger(name, singer);
            model.put("SongAdd", "Song '" +song.getName() +"' successfully delete!");

            List<Song> songList = songRepository.findAll();
            model.put("Song", songList);
        } else
            model.put("SongExc", "Нет прав на удаление");

        model.put("Song", songRepository.findAll());

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
                songIterable = songRepository.findByName(filter);
                break;
            case "singer":
                songIterable = songRepository.findBySinger(filter);
                break;
            case "album":
                songIterable = songRepository.findByAlbum(filter);
                break;
            case "style":
                songIterable = songRepository.findByStyle(filter);
                break;
            default:
                songIterable = songRepository.findAll();
                break;
        }
        model.put("Song", songIterable);
        return "song";
    }

    @PostMapping("/editSong")
    public String updateSong(
            @AuthenticationPrincipal User user,
            @RequestParam String nameEdit,
            @RequestParam String name,
            @RequestParam(required = false) String singer,
            @RequestParam(required = false) String album,
            @RequestParam(required = false) String style,
            Map<String, Object> model) {

        List<Song> songList = songRepository.findByName(nameEdit);
        Song song = songList.get(0);
        song.setName(name); song.setSinger(singer); song.setAlbum(album); song.setStyle(style);
        songRepository.save(song);

        Iterable<Song> songIterable = songRepository.findAll();
        model.put("SongUser", songIterable);

        return "editSong";
    }


}
