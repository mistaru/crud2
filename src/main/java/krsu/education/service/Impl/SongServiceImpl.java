package krsu.education.service.Impl;

import krsu.education.entity.Song;
import krsu.education.entity.User;
import krsu.education.repository.SongRepository;
import krsu.education.service.SongService;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.constraints.NotNull;
import java.util.List;


@Service
public class SongServiceImpl implements SongService {

    private final SongRepository repo;

    public SongServiceImpl(@NotNull SongRepository repo) {
        this.repo = repo;
    }

    @Override
    public Song findByName(String name) {
        return repo.findByName(name);
    }

    @Override
    public List<Song> findBySinger(String singer) {
        return repo.findBySinger(singer);
    }

    @Override
    public List<Song> findByAlbum(String album) {
        return repo.findByAlbum(album);
    }

    @Override
    public List<Song> findByStyle(String style) {
        return repo.findByStyle(style);
    }

    @Override
    public List<Song> findByAuthor(User user) {
        return repo.findByAuthor(user);
    }

    @Override
    public List<Song> findAll() {
        return repo.findAll();
    }

    @Override
    public void save(Song song) {
        repo.save(song);
    }

    @Override
    public Song findById(Long id) {
        long longId = id;
        return repo.findById(longId);
    }

    @Override
    public void deleteById(Long id) {
        repo.deleteById(id);
    }

    @Override
    public Specification<Song> filterSearch(Song todo) {

        return new Specification<Song>() {
            private static final long serialVersionUID = -4082638366492629927L;

            public Predicate toPredicate(Root<Song> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate predicate = cb.conjunction();
                if (todo != null) {

                    if (todo.getName() != null && !"".equals(todo.getName())) {
                        predicate.getExpressions().add(cb.like(root.get("name"), "%" + todo.getName() + "%"));
                    }

                    if (todo.getSinger() != null && !"".equals(todo.getSinger())) {
                        predicate.getExpressions().add(cb.equal(root.get("singer"), todo.getSinger()));
                    }

                    if (todo.getAlbum() != null && !"".equals(todo.getAlbum())) {
                        predicate.getExpressions().add(cb.equal(root.get("album"), todo.getAlbum()));
                    }

                    if (todo.getStyle() != null && !"".equals(todo.getStyle())) {
                        predicate.getExpressions().add(cb.equal(root.get("style"), todo.getStyle()));
                    }
                }
                return predicate;
            }
        };
    }

    @Override
    public List<Song> findAll(Specification<Song> specification) {
        return repo.findAll(specification);
    }

}
