package krsu.education.controller;

import krsu.education.entity.User;
import krsu.education.enums.Role;
import krsu.education.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.constraints.NotNull;
import java.util.Collections;

@Controller
public class RegistrationController {

    private final UserService service;

    public RegistrationController(@NotNull UserService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String greeting() {
        return "greeting";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model) {
        User userFromDb = service.findByUsername(user.getUsername());

        if (userFromDb != null) {
            model.addAttribute("message", "User exists!");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        service.save(user);

        return "redirect:/login";
    }
}
