package krsu.education.service;

import krsu.education.entity.User;

public interface UserService {

    User findByUsername(String username);

    void save(User user);

}
