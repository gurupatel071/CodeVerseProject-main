package com.Grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.UserTypeEntity;
import com.Grownited.repository.UserRepository;
import com.Grownited.repository.UserTypeRepository;

@Controller
public class UserTypeController {

    @Autowired
    UserTypeRepository userTypeRepository;

    @Autowired
    UserRepository userRepository;

    @GetMapping("/newUserType")
    public String newUserType() {
        return "admin/NewUserType";
    }

    @PostMapping("/saveUserType")
    public String saveUserType(UserTypeEntity userTypeEntity) {
        userTypeRepository.save(userTypeEntity);
        return "redirect:/listUserType";
    }

    @GetMapping("/listUserType")
    public String listUserType(Model model) {
        List<UserTypeEntity> allUserType = userTypeRepository.findAll();
        model.addAttribute("userTypeList", allUserType);
        return "admin/ListUserType";
    }

    @GetMapping("/deleteUserType")
    public String deleteUserType(@RequestParam("userTypeId") Integer userTypeId) {
        userTypeRepository.deleteById(userTypeId);
        return "redirect:/listUserType";
    }

    // ✅ FIXED EDIT METHOD
    @GetMapping("/editUserType")
    public String editUserType(@RequestParam("userTypeId") Integer userTypeId, Model model) {

        if (userTypeId == null) {
            return "redirect:/listUserType";
        }

        UserTypeEntity userType = userTypeRepository.findById(userTypeId).orElse(null);

        model.addAttribute("userType", userType);

        return "admin/EditUserType";
    }

    // ✅ UPDATE METHOD
    @PostMapping("/updateUserType")
    public String updateUserType(UserTypeEntity userTypeEntity) {
        userTypeRepository.save(userTypeEntity);
        return "redirect:/listUserType";
    }
}