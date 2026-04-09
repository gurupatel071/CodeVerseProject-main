package com.Grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.Grownited.entity.HackathonEntity;
import com.Grownited.repository.CategoryRepository;
import com.Grownited.repository.HackathonRepository;
import com.Grownited.repository.UserRepository;

@Controller
public class AdminController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    HackathonRepository hackathonRepository;

    @GetMapping(value = { "admin-dashboard", "/" })
    public String adminDashboard(Model model) {

        long totalUsers = userRepository.count();
        long totalCategories = categoryRepository.count();
        long totalHackathons = hackathonRepository.count();

        long upcoming = hackathonRepository.countByStatusIgnoreCase("UPCOMING");
        long ongoing = hackathonRepository.countByStatusIgnoreCase("ONGOING");
        long completed = hackathonRepository.countByStatusIgnoreCase("COMPLETED");

        List<HackathonEntity> recentHackathons = hackathonRepository.findTop5ByOrderByHackathonIdDesc();

        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalCategories", totalCategories);
        model.addAttribute("totalHackathons", totalHackathons);
        model.addAttribute("activeHackathons", ongoing);

        model.addAttribute("upcomingCount", upcoming);
        model.addAttribute("ongoingCount", ongoing);
        model.addAttribute("completedCount", completed);

        model.addAttribute("recentHackathons", recentHackathons);

        return "admin/AdminDashboard";
    }
}