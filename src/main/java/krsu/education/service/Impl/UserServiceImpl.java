package krsu.education.service.Impl;

import krsu.education.entity.User;
import krsu.education.repository.UserRepository;
import krsu.education.service.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;

@Service
public class UserServiceImpl implements UserDetailsService, UserService {

    private final UserRepository repo;

    public UserServiceImpl(@NotNull UserRepository repo) {
        this.repo = repo;
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return repo.findByUsername(username);
    }


    @Override
    public User findByUsername(String username) {
        return repo.findByUsername(username);
    }


    @Override
    public void save(User user) {
        repo.save(user);
    }

}
