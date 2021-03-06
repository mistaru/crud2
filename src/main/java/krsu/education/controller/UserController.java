package krsu.education.controller;

import krsu.education.enums.Role;
import krsu.education.entity.User;
import krsu.education.repository.UserRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

    private final UserRepository userRepo;

    public UserController(@NotNull UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    @GetMapping("/list")
    public String userList(Model model) {
        model.addAttribute("users", userRepo.findAll());
        return "user-list";
    }

    @PostMapping
    public String userSave(@RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user) {

        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);

        return "redirect:/user";
    }
}
